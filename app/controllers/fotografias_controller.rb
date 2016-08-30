class FotografiasController < ApplicationController
  before_action :set_fotografia, only: [:show, :edit, :update, :destroy]

  # GET /fotografias
  # GET /fotografias.json
  def index
    @fotografias = Fotografia.all
  end

  # GET /fotografias/1
  # GET /fotografias/1.json
  def show
  end

  # GET /fotografias/new
  def new
    @fotografia = Fotografia.new
  end

  # GET /fotografias/1/edit
  def edit
  end

  # POST /fotografias
  # POST /fotografias.json
  def create
    @fotografia = Fotografia.new(fotografia_params)

    respond_to do |format|
      if @fotografia.save
        format.html { redirect_to @fotografia, notice: 'Fotografia was successfully created.' }
        format.json { render :show, status: :created, location: @fotografia }
      else
        format.html { render :new }
        format.json { render json: @fotografia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fotografias/1
  # PATCH/PUT /fotografias/1.json
  def update
    respond_to do |format|
      if @fotografia.update(fotografia_params)
        format.html { redirect_to @fotografia, notice: 'Fotografia was successfully updated.' }
        format.json { render :show, status: :ok, location: @fotografia }
      else
        format.html { render :edit }
        format.json { render json: @fotografia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fotografias/1
  # DELETE /fotografias/1.json
  def destroy
    @fotografia.destroy
    respond_to do |format|
      format.html { redirect_to fotografias_url, notice: 'Fotografia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fotografia
      @fotografia = Fotografia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fotografia_params
      params.fetch(:fotografia, {})
    end
end
