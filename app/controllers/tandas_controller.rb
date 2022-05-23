class TandasController < ApplicationController
  before_action :set_tanda, only: %i[ show edit update destroy cierra recupera]

  # GET /tandas or /tandas.json
  def index
    @coleccion = {}
    @coleccion['tandas'] = Tanda.all.order(:horario)
  end

  # GET /tandas/1 or /tandas/1.json
  def show
  end

  # GET /tandas/new
  def new
    @objeto = Tanda.new
  end

  # GET /tandas/1/edit
  def edit
  end

  # POST /tandas or /tandas.json
  def create
    @objeto = Tanda.new(tanda_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Tanda was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tandas/1 or /tandas/1.json
  def update
    respond_to do |format|
      if @objeto.update(tanda_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Tanda was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  def cierra
    fecha = Date.parse(params[:fecha])
    cierres_fecha = Cierre.where(fecha: fecha)
    if cierres_fecha.empty?
      Cierre.create(fecha: fecha, horario: @objeto.horario)
    else
      cierre_tanda = cierres_fecha.where(horario: @objeto.horario)
      if cierre_tanda.empty?
        Cierre.create(fecha: fecha, horario: @objeto.horario)
      end
    end
    
    redirect_to "/reservas?d=#{params[:fecha].split('-').join('')}"
  end

  def recupera
    fecha = Date.parse(params[:fecha])
    cierres_fecha = Cierre.where(fecha: fecha)
    if cierres_fecha.any?
      cierre_tanda = cierres_fecha.where(horario: @objeto.horario)
      if cierre_tanda.any?
        cierre_tanda.delete_all
      end
    end
    
    redirect_to "/reservas?d=#{params[:fecha].split('-').join('')}"
  end

  # DELETE /tandas/1 or /tandas/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Tanda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tanda
      @objeto = Tanda.find(params[:id])
    end

    def set_redireccion
      @redireccion = tandas_path
    end

    # Only allow a list of trusted parameters through.
    def tanda_params
      params.require(:tanda).permit(:turno, :orden, :horario, :capacidad, :cerrado)
    end
end
