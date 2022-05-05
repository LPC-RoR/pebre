class LlamadasController < ApplicationController
  before_action :set_llamada, only: %i[ show edit update destroy ]

  # GET /llamadas or /llamadas.json
  def index
    @llamadas = Llamada.all
  end

  # GET /llamadas/1 or /llamadas/1.json
  def show
  end

  # GET /llamadas/new
  def new
    @llamada = Llamada.new
  end

  # GET /llamadas/1/edit
  def edit
  end

  # POST /llamadas or /llamadas.json
  def create
    @llamada = Llamada.new(llamada_params)

    respond_to do |format|
      if @llamada.save
        format.html { redirect_to @llamada, notice: "Llamada was successfully created." }
        format.json { render :show, status: :created, location: @llamada }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @llamada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /llamadas/1 or /llamadas/1.json
  def update
    respond_to do |format|
      if @llamada.update(llamada_params)
        format.html { redirect_to @llamada, notice: "Llamada was successfully updated." }
        format.json { render :show, status: :ok, location: @llamada }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @llamada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /llamadas/1 or /llamadas/1.json
  def destroy
    @llamada.destroy
    respond_to do |format|
      format.html { redirect_to llamadas_url, notice: "Llamada was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_llamada
      @llamada = Llamada.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def llamada_params
      params.require(:llamada).permit(:anombre, :contacto, :hora, :paxs, :anulada)
    end
end
