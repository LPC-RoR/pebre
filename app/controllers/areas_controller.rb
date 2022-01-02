class AreasController < ApplicationController
  before_action :set_area, only: %i[ show edit update destroy ]

  # GET /areas or /areas.json
  def index
    @coleccion = Area.all
  end

  # GET /areas/1 or /areas/1.json
  def show
  end

  # GET /areas/new
  def new
    @objeto = Area.new
  end

  # GET /areas/1/edit
  def edit
  end

  # POST /areas or /areas.json
  def create
    @objeto = Area.new(area_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Area was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areas/1 or /areas/1.json
  def update
    respond_to do |format|
      if @objeto.update(area_params)
        format.html { redirect_to @objeto, notice: "Area was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1 or /areas/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: "Area was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @objeto = Area.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def area_params
      params.require(:area).permit(:area, :acceso, :proyecto_id)
    end
end
