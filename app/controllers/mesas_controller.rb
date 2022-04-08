class MesasController < ApplicationController
  before_action :set_mesa, only: %i[ show edit update destroy reservar]

  # GET /mesas or /mesas.json
  def index
    @coleccion = {}
    @coleccion['mesas'] = Mesa.all.order(:mesa)
  end

  # GET /mesas/1 or /mesas/1.json
  def show
  end

  def reservar
    hoy = Date.today
    reservacion = Reservacion.where(fecha: hoy)
    if reservacion.empty?
      reservar = true
    else
      reservacion = reservacion.where(servicio: @objeto.servicio)
      if reservacion.empty?
        reservar = true
      else
        reservacion = reservacion.where(mesa: @objeto.mesa)
        if reservacion.empty?
          reservar = true
        else
          reservar = false
        end
      end
    end
    if reservar == true
      redirect_to "reservaciones/new?servicio=#{@objeto.servicio}"
    end
  end    

  # GET /mesas/new
  def new
    @objeto = Mesa.new
  end

  # GET /mesas/1/edit
  def edit
  end

  # POST /mesas or /mesas.json
  def create
    @objeto = Mesa.new(mesa_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Mesa was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mesas/1 or /mesas/1.json
  def update
    respond_to do |format|
      if @objeto.update(mesa_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Mesa was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mesas/1 or /mesas/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Mesa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mesa
      @objeto = Mesa.find(params[:id])
    end

    def set_redireccion
      @redireccion = mesas_path
    end

    # Only allow a list of trusted parameters through.
    def mesa_params
      params.require(:mesa).permit(:zona, :mesa, :reserva, :pasajeros, :horario, :servicio)
    end
end
