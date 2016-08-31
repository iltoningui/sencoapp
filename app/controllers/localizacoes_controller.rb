class LocalizacoesController < ApplicationController
  before_action :set_localizacao, only: [:show, :edit, :update, :destroy]

  # GET /localizacoes
  # GET /localizacoes.json
  def index
    @localizacoes = Localizacao.all
    @hash = Gmaps4rails.build_markers(@localizacoes) do |localizacao, marker|
      marker.lat localizacao.latitude
      marker.lng localizacao.longitude
      marker.infowindow gmaps4rails_infowindow(localizacao)
      #marker.title gmaps4rails_title(localizacao)
      #marker.picture gmaps4rails_marker_picture
 #    marker.json({:title => localizacao.locationable.email})
 #    marker.infowindow render_to_string(:partial => "/users/my_template", :locals => { :object => user})
 # marker.picture({
  #                :url => "http://www.blankdots.com/img/github-32x32.png",
   #               :width   => 32,
#                  :height  => 32
 #                })
  #marker.title   "i'm the title"
  #marker.sidebar "i'm the sidebar"
  #marker.json({ :id => user.id, :foo => "bar" })

    end
  end


  def gmaps4rails_infowindow(localizacao)
    '<div class="row"><div class="col x4">#{link_to "Entrar", loja}</div><div class="col x8">fdgfhgjkjhjgfgdfdgfhg</div></div>'
      # add here whatever html content you desire, it will be displayed when users clicks on the marker
  end

  def gmaps4rails_title(localizacao)
    #localizacao.locationable.nome if localizacao.locationable_type == "Loja"
      # add here whatever text you desire
  end


  def gmaps4rails_sidebar
    '<span class="foo">"#{name}"</span>' #put whatever you want here    
  end

  #def gmaps4rails_marker_picture
   #   { picture: "/assets/1.jpg", width: "28", height: "33" }
  #end
#def gmaps4rails_marker_picture
# {
#  "picture" => ,          # string,  mandatory
 #  "width" =>  ,          # integer, mandatory
  # "height" => ,          # integer, mandatory
#   "marker_anchor" => ,   # array,   facultative, [0, 0] is the upper left corner 
 #                         #                       and [width, height] is the bottom right
  # "shadow_picture" => ,  # string,  facultative
#   "shadow_width" => ,    # string,  facultative
#   "shadow_height" => ,   # string,  facultative
 #  "shadow_anchor" => ,   # string,  facultative
  # "rich_marker" =>   ,   # html, facultative
                          # If used, all other attributes skipped except "marker_anchor". This array is used as follows:
                          # [ anchor , flat ] : flat is a boolean, anchor is an int. 
                          # See doc here: http://google-maps-utility-library-v3.googlecode.com/svn/trunk/richmarker/docs/reference.html 
 #}
#end

def gmaps4rails_marker_picture
  {
    "rich_marker" =>  "<div class='my-marker'>It works!<img height='30' width='30' src='http://farm4.static.flickr.com/3212/3012579547_097e27ced9_m.jpg'/></div>"
  }
end
  #@markers = '[
   #          {"description": "", "title": "", "sidebar": "", "lng": "", "lat": "", "picture": "", "width": "", "height": ""},
    #         {"lng": "", "lat": "" }
     #       ]'
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
