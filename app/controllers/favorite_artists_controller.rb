class FavoriteArtistsController < ApplicationController
  before_action :set_favorite_artist, only: [:show, :edit, :update, :destroy]

  # GET /favorite_artists
  # GET /favorite_artists.json
  def index
    @favorite_artists = current_user.favorite_artists
  end

  # GET /favorite_artists/1
  # GET /favorite_artists/1.json
  def show
  end

  # GET /favorite_artists/new
  def new
    @favorite_artist = FavoriteArtist.new
  end

  # GET /favorite_artists/1/edit
  def edit
  end

  # POST /favorite_artists
  # POST /favorite_artists.json
  def create
    @favorite_artist = current_user.favorite_artists.build(favorite_artist_params)

    respond_to do |format|
      if @favorite_artist.save
        format.html { redirect_to @favorite_artist, notice: 'Favorite artist was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_artist }
      else
        format.html { render :new }
        format.json { render json: @favorite_artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_artists/1
  # PATCH/PUT /favorite_artists/1.json
  def update
    respond_to do |format|
      if @favorite_artist.update(favorite_artist_params)
        format.html { redirect_to @favorite_artist, notice: 'Favorite artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite_artist }
      else
        format.html { render :edit }
        format.json { render json: @favorite_artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_artists/1
  # DELETE /favorite_artists/1.json
  def destroy
    @favorite_artist.destroy
    respond_to do |format|
      format.html { redirect_to favorite_artists_url, notice: 'Favorite artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_artist
      @favorite_artist = FavoriteArtist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_artist_params
      params.require(:favorite_artist).permit(:user_id, :artist_id)
    end
end
