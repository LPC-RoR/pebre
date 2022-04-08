class DetalleReservasController < ApplicationController
  before_action :set_detalle_reserva, only: %i[ show edit update destroy ]

  # GET /detalle_reservas or /detalle_reservas.json
  def index
    @detalle_reservas = DetalleReserva.all
  end

  # GET /detalle_reservas/1 or /detalle_reservas/1.json
  def show
  end

  # GET /detalle_reservas/new
  def new
    @detalle_reserva = DetalleReserva.new
  end

  # GET /detalle_reservas/1/edit
  def edit
  end

  # POST /detalle_reservas or /detalle_reservas.json
  def create
    @detalle_reserva = DetalleReserva.new(detalle_reserva_params)

    respond_to do |format|
      if @detalle_reserva.save
        format.html { redirect_to @detalle_reserva, notice: "Detalle reserva was successfully created." }
        format.json { render :show, status: :created, location: @detalle_reserva }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @detalle_reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_reservas/1 or /detalle_reservas/1.json
  def update
    respond_to do |format|
      if @detalle_reserva.update(detalle_reserva_params)
        format.html { redirect_to @detalle_reserva, notice: "Detalle reserva was successfully updated." }
        format.json { render :show, status: :ok, location: @detalle_reserva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @detalle_reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_reservas/1 or /detalle_reservas/1.json
  def destroy
    @detalle_reserva.destroy
    respond_to do |format|
      format.html { redirect_to detalle_reservas_url, notice: "Detalle reserva was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_reserva
      @detalle_reserva = DetalleReserva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def detalle_reserva_params
      params.require(:detalle_reserva).permit(:fecha, :servicio, :salon, :mesa, :horario)
    end
end
