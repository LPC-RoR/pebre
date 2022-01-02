class ProyectosController < ApplicationController
  before_action :set_proyecto, only: %i[ show edit update destroy ]

  # GET /proyectos or /proyectos.json
  def index
    @coleccion = Proyecto.all
  end

  # GET /proyectos/1 or /proyectos/1.json
  def show
    @coleccion = {}
    @coleccion['areas'] = @objeto.areas.order(:area)
  end

  # GET /proyectos/new
  def new
    @objeto = Proyecto.new(estado: 'estudio')
  end

  # GET /proyectos/1/edit
  def edit
  end

  # POST /proyectos or /proyectos.json
  def create
    @objeto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Proyecto was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos/1 or /proyectos/1.json
  def update
    respond_to do |format|
      if @objeto.update(proyecto_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Proyecto was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1 or /proyectos/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Proyecto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @objeto = Proyecto.find(params[:id])
    end

    def set_redireccion
      @redireccion = "/st_bandejas?m=Proyecto&e=estudio" 
    end

    # Only allow a list of trusted parameters through.
    def proyecto_params
      params.require(:proyecto).permit(:proyecto, :razon_social, :rut, :direccion, :estado)
    end
end
