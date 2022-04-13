class ReservasController < ApplicationController
  before_action :set_reserva, only: %i[ show edit update destroy confirmacion ]

  # GET /reservas or /reservas.json
  def index
    @fecha = (params[:d].blank? ? Date.today : Date.parse(params[:d]))
    @lunes = (@fecha.strftime("%A") == 'Monday')

    @coleccion = {}
    ids_dia = Reserva.all.map {|res| res.id if res.fecha.to_date == @fecha}.compact
    @coleccion['reservas'] = Reserva.where(id: ids_dia)
  end

  def reservacion
    @fecha = Date.today
    @coleccion = {}
    @coleccion['almuerzos'] = Mesa.where(servicio: 'Almuerzo').order(:horario)
    @coleccion['cenas'] = Mesa.where(servicio: 'Cena').order(:horario)
  end

  # GET /reservas/1 or /reservas/1.json
  def show
  end

  # GET /reservas/new
  def new
    # Hay que pasar la fecha
    @fecha = Date.parse(params[:d])
    # Se deben cargar los horarios de un día en particular
    @horarios = Tanda.all.map {|tan| tan.horario.split('-')[0] if abierto(@fecha, tan.horario) }.compact.sort!


    cierre_id = Cierre.all.map {|cie| cie.id if cie.fecha.to_s == Date.today.to_s}.compact

    @dia_abierto = (cierre_id.empty? and not @fecha.strftime("%A") == 'Monday')
    @objeto = Reserva.new(fecha: @fecha)
  end

  def elige_dia
    fecha =  params[:dia_elegido]['fecha(1i)']+params[:dia_elegido]['fecha(2i)'].rjust(2, "0")+params[:dia_elegido]['fecha(3i)'].rjust(2, "0")

    redirect_to "/reservas/new?d=#{fecha}"
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
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @objeto = Reserva.find(params[:id])
    end

    def set_redireccion
      @redireccion = "/reservas/#{@objeto.id}/confirmacion"
    end

    # Only allow a list of trusted parameters through.
    def reserva_params
      params.require(:reserva).permit(:anombre, :fecha, :n_personas, :n_contacto, :indicaciones, :hora)
    end

end
