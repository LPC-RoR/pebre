class ReservasController < ApplicationController
  before_action :set_reserva, only: %i[ show edit update destroy ]

  # GET /reservas or /reservas.json
  def index
    @coleccion = Reserva.all
  end

  # GET /reservas/1 or /reservas/1.json
  def show
  end

  # GET /reservas/new
  def new
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
        format.html { redirect_to @objeto, notice: "Reserva was successfully created." }
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
        format.html { redirect_to @objeto, notice: "Reserva was successfully updated." }
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

    # Only allow a list of trusted parameters through.
    def reserva_params
      params.require(:reserva).permit(:anombre, :fecha, :n_personas, :n_contacto, :indicaciones)
    end
end
