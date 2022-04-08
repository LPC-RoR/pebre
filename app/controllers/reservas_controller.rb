class ReservasController < ApplicationController
  before_action :set_reserva, only: %i[ show edit update destroy confirmacion ]

  # GET /reservas or /reservas.json
  def index
    puts params[:d]
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
    # Se deben cargar los horarios de un día en particular
    @horarios = Tanda.all.map {|tan| tan.horario.split('-')[0] }.sort!



    cierre_id = Cierre.all.map {|cie| cie.id if cie.fecha.to_s == Date.today.to_s}.compact
    @dia_abierto = cierre_id.empty?
    @objeto = Reserva.new
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
