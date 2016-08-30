class LocalizacoesController < ApplicationController
  before_action :set_localizacao, only: [:show, :edit, :update, :destroy]

  # GET /localizacoes
  # GET /localizacoes.json
  def index
    @localizacoes = Localizacao.all
  end

  # GET /localizacoes/1
  # GET /localizacoes/1.json
  def show
  end

  # GET /localizacoes/new
  def new
    @localizacao = Localizacao.new
  end

  # GET /localizacoes/1/edit
  def edit
  end

  # POST /localizacoes
  # POST /localizacoes.json
  def create
    @localizacao = Localizacao.new(localizacao_params)

    respond_to do |format|
      if @localizacao.save
        format.html { redirect_to @localizacao, notice: 'Localizacao was successfully created.' }
        format.json { render :show, status: :created, location: @localizacao }
      else
        format.html { render :new }
        format.json { render json: @localizacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /localizacoes/1
  # PATCH/PUT /localizacoes/1.json
  def update
    respond_to do |format|
      if @localizacao.update(localizacao_params)
        format.html { redirect_to @localizacao, notice: 'Localizacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @localizacao }
      else
        format.html { render :edit }
        format.json { render json: @localizacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /localizacoes/1
  # DELETE /localizacoes/1.json
  def destroy
    @localizacao.destroy
    respond_to do |format|
      format.html { redirect_to localizacoes_url, notice: 'Localizacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_localizacao
      @localizacao = Localizacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def localizacao_params
      params.require(:localizacao).permit(:latitude, :longitude)
    end
end
