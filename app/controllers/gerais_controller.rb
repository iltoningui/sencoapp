class GeraisController < ApplicationController
  before_action :set_geral, only: [:show, :edit, :update, :destroy]

  # GET /gerais
  # GET /gerais.json
  def index
    @gerais = Geral.all
  end

  # GET /gerais/1
  # GET /gerais/1.json
  def show
  end

  # GET /gerais/new
  def new
    @geral = Geral.new
  end

  # GET /gerais/1/edit
  def edit
  end

  # POST /gerais
  # POST /gerais.json
  def create
    @geral = Geral.new(geral_params)

    respond_to do |format|
      if @geral.save
        format.html { redirect_to @geral, notice: 'Geral was successfully created.' }
        format.json { render :show, status: :created, location: @geral }
      else
        format.html { render :new }
        format.json { render json: @geral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gerais/1
  # PATCH/PUT /gerais/1.json
  def update
    respond_to do |format|
      if @geral.update(geral_params)
        format.html { redirect_to @geral, notice: 'Geral was successfully updated.' }
        format.json { render :show, status: :ok, location: @geral }
      else
        format.html { render :edit }
        format.json { render json: @geral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gerais/1
  # DELETE /gerais/1.json
  def destroy
    @geral.destroy
    respond_to do |format|
      format.html { redirect_to gerais_url, notice: 'Geral was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geral
      @geral = Geral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geral_params
      params.fetch(:geral, {})
    end
end
