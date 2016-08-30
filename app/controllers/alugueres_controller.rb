class AlugueresController < ApplicationController
  before_action :set_aluguer, only: [:show, :edit, :update, :destroy]

  # GET /alugueres
  # GET /alugueres.json
  def index
    @alugueres = Aluguer.all
  end

  # GET /alugueres/1
  # GET /alugueres/1.json
  def show
  end

  # GET /alugueres/new
  def new
    @aluguer = Aluguer.new
  end

  # GET /alugueres/1/edit
  def edit
  end

  # POST /alugueres
  # POST /alugueres.json
  def create
    @aluguer = Aluguer.new(aluguer_params)

    respond_to do |format|
      if @aluguer.save
        format.html { redirect_to @aluguer, notice: 'Aluguer was successfully created.' }
        format.json { render :show, status: :created, location: @aluguer }
      else
        format.html { render :new }
        format.json { render json: @aluguer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alugueres/1
  # PATCH/PUT /alugueres/1.json
  def update
    respond_to do |format|
      if @aluguer.update(aluguer_params)
        format.html { redirect_to @aluguer, notice: 'Aluguer was successfully updated.' }
        format.json { render :show, status: :ok, location: @aluguer }
      else
        format.html { render :edit }
        format.json { render json: @aluguer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alugueres/1
  # DELETE /alugueres/1.json
  def destroy
    @aluguer.destroy
    respond_to do |format|
      format.html { redirect_to alugueres_url, notice: 'Aluguer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluguer
      @aluguer = Aluguer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluguer_params
      params.fetch(:aluguer, {})
    end
end
