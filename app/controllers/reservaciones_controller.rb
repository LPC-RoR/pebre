class ReservacionesController < ApplicationController
  before_action :set_reservacion, only: %i[ show edit update destroy ]

  # GET /reservaciones or /reservaciones.json
  def index
    @coleccion = Reservacion.all
  end

  # GET /reservaciones/1 or /reservaciones/1.json
  def show
  end

  # GET /reservaciones/new
  def new
    @objeto = Reservacion.new
  end

  # GET /reservaciones/1/edit
  def edit
  end

  # POST /reservaciones or /reservaciones.json
  def create
    @objeto = Reservacion.new(reservacion_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Reservacion was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservaciones/1 or /reservaciones/1.json
  def update
    respond_to do |format|
      if @objeto.update(reservacion_params)
        format.html { redirect_to @objeto, notice: "Reservacion was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservaciones/1 or /reservaciones/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to reservaciones_url, notice: "Reservacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservacion
      @objeto = Reservacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservacion_params
      params.require(:reservacion).permit(:fecha, :servicio, :zona, :mesa, :pasajeros, :hora, :anombre, :n_contacto)
    end
end
