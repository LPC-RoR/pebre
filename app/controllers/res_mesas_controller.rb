class ResMesasController < ApplicationController
  before_action :set_res_mesa, only: %i[ show edit update destroy ]

  # GET /res_mesas or /res_mesas.json
  def index
    @res_mesas = ResMesa.all
  end

  # GET /res_mesas/1 or /res_mesas/1.json
  def show
  end

  # GET /res_mesas/new
  def new
    @res_mesa = ResMesa.new
  end

  # GET /res_mesas/1/edit
  def edit
  end

  # POST /res_mesas or /res_mesas.json
  def create
    @res_mesa = ResMesa.new(res_mesa_params)

    respond_to do |format|
      if @res_mesa.save
        format.html { redirect_to @res_mesa, notice: "Res mesa was successfully created." }
        format.json { render :show, status: :created, location: @res_mesa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @res_mesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /res_mesas/1 or /res_mesas/1.json
  def update
    respond_to do |format|
      if @res_mesa.update(res_mesa_params)
        format.html { redirect_to @res_mesa, notice: "Res mesa was successfully updated." }
        format.json { render :show, status: :ok, location: @res_mesa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @res_mesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /res_mesas/1 or /res_mesas/1.json
  def destroy
    @res_mesa.destroy
    respond_to do |format|
      format.html { redirect_to res_mesas_url, notice: "Res mesa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_res_mesa
      @res_mesa = ResMesa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def res_mesa_params
      params.require(:res_mesa).permit(:reserva_id, :mesa_id)
    end
end
