class LlamadasController < ApplicationController
  before_action :set_llamada, only: %i[ show edit update destroy ]

  # GET /llamadas or /llamadas.json
  def index
    @coleccion = Llamada.all
  end

  # GET /llamadas/1 or /llamadas/1.json
  def show
  end

  # GET /llamadas/new
  def new
    # Hay que pasar la fecha
    @fecha = Date.parse(params[:d])

    @objeto = Llamada.new(fecha: @fecha)

    @domingo = (@fecha.strftime("%A") == 'Sunday')
    tandas = (@domingo ? Tanda.where(turno: 'Almuerzo') : Tanda.all)

    # Se deben cargar los horarios de un día en particular
    @horarios = tandas.map {|tan| tan.horario.split('-')[0] if abierto(@fecha, tan.horario) }.compact.sort!

  end

  # GET /llamadas/1/edit
  def edit
  end

  # POST /llamadas or /llamadas.json
  def create
    @objeto = Llamada.new(llamada_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Llamada was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /llamadas/1 or /llamadas/1.json
  def update
    respond_to do |format|
      if @objeto.update(llamada_params)
        format.html { redirect_to @objeto, notice: "Llamada was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /llamadas/1 or /llamadas/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to llamadas_url, notice: "Llamada was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def abierto(fecha, horario)

      ids_dia = Llamada.all.map {|lla| lla.id if lla.fecha.to_date == @fecha}.compact
      llamadas_dia = Llamada.where(id: ids_dia)

      tanda = Tanda.find_by(horario: horario)

      desde = horario.split('-')[0]
      hasta = horario.split('-')[1]

      lla_ids = llamadas_dia.all.map {|lla| lla.id if (lla.hora >= desde and lla.hora < hasta)}.compact
      reservadas = (lla_ids.empty? ? 0 : Llamada.where(id: lla_ids).map {|lla| lla.n_personas.to_i}.sum)
      tanda.capacidad > reservadas
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_llamada
      @objeto = Llamada.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def llamada_params
      params.require(:llamada).permit(:anombre, :contacto, :hora, :paxs, :anulada, :fecha)
    end
end
