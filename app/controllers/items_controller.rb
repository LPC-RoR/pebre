class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @coleccion = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @objeto = Item.new(grupo_id: params[:grupo_id])
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @objeto = Item.new(item_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @objeto.update(item_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @objeto = Item.find(params[:id])
    end

    def set_redireccion
      @redireccion = @objeto.grupo
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:orden, :codigo, :item, :precio, :activo, :pesca_del_dia, :grupo_id)
    end
end
