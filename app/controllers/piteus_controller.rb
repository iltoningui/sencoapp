class PiteusController < ApplicationController
  before_action :set_piteu, only: [:show, :edit, :update, :destroy]

  # GET /piteus
  # GET /piteus.json
  def index
    @piteus = Piteu.all
  end

  # GET /piteus/1
  # GET /piteus/1.json
  def show
  end

  # GET /piteus/new
  def new
    @piteu = Piteu.new
  end

  # GET /piteus/1/edit
  def edit
  end

  # POST /piteus
  # POST /piteus.json
  def create
    @piteu = Piteu.new(piteu_params)

    respond_to do |format|
      if @piteu.save
        format.html { redirect_to @piteu, notice: 'Piteu was successfully created.' }
        format.json { render :show, status: :created, location: @piteu }
      else
        format.html { render :new }
        format.json { render json: @piteu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /piteus/1
  # PATCH/PUT /piteus/1.json
  def update
    respond_to do |format|
      if @piteu.update(piteu_params)
        format.html { redirect_to @piteu, notice: 'Piteu was successfully updated.' }
        format.json { render :show, status: :ok, location: @piteu }
      else
        format.html { render :edit }
        format.json { render json: @piteu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /piteus/1
  # DELETE /piteus/1.json
  def destroy
    @piteu.destroy
    respond_to do |format|
      format.html { redirect_to piteus_url, notice: 'Piteu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piteu
      @piteu = Piteu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def piteu_params
      params.fetch(:piteu, {})
    end
end
