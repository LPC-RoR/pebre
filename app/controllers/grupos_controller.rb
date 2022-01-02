class GruposController < ApplicationController
  before_action :set_grupo, only: %i[ show edit update destroy ]

  include Sidebar

  # GET /grupos or /grupos.json
  def index
    @coleccion = {}
    @coleccion['grupos'] = Grupo.all.order(:orden)
  end

  # GET /grupos/1 or /grupos/1.json
  def show
    @coleccion = {}
    @coleccion['items'] = @objeto.items.order(:orden)
  end

  # GET /grupos/new
  def new
    @objeto = Grupo.new
  end

  # GET /grupos/1/edit
  def edit
  end

  # POST /grupos or /grupos.json
  def create
    @objeto = Grupo.new(grupo_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Grupo was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupos/1 or /grupos/1.json
  def update
    respond_to do |format|
      if @objeto.update(grupo_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Grupo was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupos/1 or /grupos/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Grupo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo
      @objeto = Grupo.find(params[:id])
    end

    def set_redireccion
      @redireccion = "/app_recursos/administracion?id=#{get_elemento_id(controller_name, 'Grupos')}" 
    end

    # Only allow a list of trusted parameters through.
    def grupo_params
      params.require(:grupo).permit(:orden, :grupo, :activo)
    end
end
