class CierresController < ApplicationController
  before_action :set_cierre, only: %i[ show edit update destroy ]

  # GET /cierres or /cierres.json
  def index
    @coleccion = {}
    @coleccion['cierres'] = Cierre.all.order(:fecha)
  end

  # GET /cierres/1 or /cierres/1.json
  def show
  end

  # GET /cierres/new
  def new
    @objeto = Cierre.new
  end

  # GET /cierres/1/edit
  def edit
  end

  # POST /cierres or /cierres.json
  def create
    @objeto = Cierre.new(cierre_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Cierre was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cierres/1 or /cierres/1.json
  def update
    respond_to do |format|
      if @objeto.update(cierre_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Cierre was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cierres/1 or /cierres/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Cierre was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cierre
      @objeto = Cierre.find(params[:id])
    end

    def set_redireccion
      @redireccion = cierres_path
    end

    # Only allow a list of trusted parameters through.
    def cierre_params
      params.require(:cierre).permit(:fecha)
    end
end
