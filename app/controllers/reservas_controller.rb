class ReservasController < ApplicationController
  before_action :set_reserva, only: %i[ show edit update destroy confirmacion anula recupera asigna_mesa elimina_mesa]

  # GET /reservas or /reservas.json
  def index
    @fecha = (params[:d].blank? ? Date.today : Date.parse(params[:d]))
    @lunes = (@fecha.strftime("%A") == 'Monday')

    @coleccion = {}
    @coleccion['tandas'] = Tanda.all.order(:horario)

    ids_dia = Reserva.all.map {|res| res.id if res.fecha.to_date == @fecha}.compact
    @coleccion['reservas'] = Reserva.where(id: ids_dia)
    @coleccion['reservas'] = @coleccion['reservas'].order(:hora) if @coleccion['reservas'].any?

    ids_dia = Llamada.all.map {|lla| lla.id if lla.fecha.to_date == @fecha}.compact
    @coleccion['llamadas'] = Llamada.where(id: ids_dia)
    @coleccion['llamadas'] = @coleccion['llamadas'].order(:hora) if @coleccion['llamadas'].any?

    @tanda = {}
    @llamadas = {}
    Tanda.all.order(:horario).each do |tanda|
      horas = tanda.horario.split('-')
      res_ids = @coleccion['reservas'].map {|res| res.id if res.hora >= horas[0] and res.hora < horas[1]}.compact
      @tanda[tanda.horario] = @coleccion['reservas'].empty? ? [] : @coleccion['reservas'].where(id: res_ids)

      lla_ids = @coleccion['llamadas'].map {|lla| lla.id if lla.hora >= horas[0] and lla.hora < horas[1]}.compact
      @llamadas[tanda.horario] = @coleccion['llamadas'].empty? ? [] : @coleccion['llamadas'].where(id: res_ids)
    end
  end

  def reservacion
    @fecha = Date.today
    @coleccion = {}
    @coleccion['almuerzos'] = Mesa.where(servicio: 'Almuerzo').order(:horario)
    @coleccion['cenas'] = Mesa.where(servicio: 'Cena').order(:horario)
  end

  # GET /reservas/1 or /reservas/1.json
  def show
    reservas_dia = Reserva.where(fecha: @objeto.fecha).where(hora: horarios_servicio(@objeto.hora))
    ocupadas_ids = []
    reservas_dia.each do |res|
      ocupadas_ids = ocupadas_ids.union(res.mesas.ids)
    end

    mesas_disponibles_ids = Mesa.all.ids - ocupadas_ids

    @mesas_reserva = @objeto.mesas
    @mesas_disponibles = Mesa.where(id: mesas_disponibles_ids)

  end

  # GET /reservas/new
  def new
    # Hay que pasar la fecha
    @fecha = Date.parse(params[:d])
    # diferencia reservas por web de las ingresadas
    origen = params[:origen].blank? ? 'usuario' : 'www'

    @domingo = (@fecha.strftime("%A") == 'Sunday')
    tandas = (@domingo ? Tanda.where(turno: 'Almuerzo') : Tanda.all)

    # Se deben cargar los horarios de un día en particular
    puts "******************************************* new"
    horarios_tandas = tandas.map {|tan| tan.horario.split('-')[0] if abierto(@fecha, tan.horario) }.compact.sort!
    puts "*************************** #{horarios_tandas.any?}"
    if Cierre.all.any?
      horarios_cerrados = Cierre.all.map {|cie| cie.horario.split('-')[0] if cie.fecha.to_s == @fecha.to_s}.compact
    else
    end
    @horarios = horarios_tandas - horarios_cerrados

    @dia_abierto = (@horarios.any? and not @fecha.strftime("%A") == 'Monday')
    @objeto = Reserva.new(fecha: @fecha, origen: origen, switch: true)
  end

  def elige_dia
    fecha =  params[:dia_elegido]['fecha(1i)']+params[:dia_elegido]['fecha(2i)'].rjust(2, "0")+params[:dia_elegido]['fecha(3i)'].rjust(2, "0")

    redirect_to "/reservas/new?d=#{fecha}&origen=www"
  end

  def dia_reserva
    
  end

  # GET /reservas/1/edit
  def edit
  end

  # POST /reservas or /reservas.json
  def create
    @objeto = Reserva.new(reserva_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Reserva was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservas/1 or /reservas/1.json
  def update
    respond_to do |format|
      if @objeto.update(reserva_params)
        format.html { redirect_to reservas_url, notice: "Reserva was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  def anula
    @objeto.switch = false
    @objeto.save
    redirect_to "/reservas?d=#{@objeto.fecha}"
  end

  def recupera
    @objeto.switch = true
    @objeto.save
    redirect_to "/reservas?d=#{@objeto.fecha}"
  end

  def asigna_mesa
    mesa = Mesa.find(params[:mesa])
    @objeto.mesas << mesa

    redirect_to @objeto
  end

  def elimina_mesa
    mesa = Mesa.find(params[:mesa])
    @objeto.mesas.delete(mesa)

    redirect_to @objeto
  end

  # DELETE /reservas/1 or /reservas/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to reservas_url, notice: "Reserva was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def abierto(fecha, horario)

      ids_dia = Reserva.all.map {|res| res.id if res.fecha.to_date == @fecha}.compact
      reservas_dia = Reserva.where(id: ids_dia)

      tanda = Tanda.find_by(horario: horario)

      desde = horario.split('-')[0]
      hasta = horario.split('-')[1]
      res_ids = reservas_dia.all.map {|res| res.id if (res.hora >= desde and res.hora < hasta)}.compact
      reservadas = (res_ids.empty? ? 0 : Reserva.where(id: res_ids).map {|res| res.n_personas.to_i}.sum)
      tanda.capacidad > reservadas
    end

    def horarios_servicio(hora)
      if ['13:00', '13:30', '14:00', '14:30', '15:00'].include?(hora)
        ['13:00', '13:30', '14:00', '14:30', '15:00']
      else
        ['19:00', '19:30', '20:00', '20:30', '21:00']
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @objeto = Reserva.find(params[:id])
    end

    def set_redireccion
      @redireccion = "/reservas/#{@objeto.id}/confirmacion"
    end

    # Only allow a list of trusted parameters through.
    def reserva_params
      params.require(:reserva).permit(:anombre, :fecha, :n_personas, :n_contacto, :indicaciones, :hora, :origen, :switch)
    end

end
