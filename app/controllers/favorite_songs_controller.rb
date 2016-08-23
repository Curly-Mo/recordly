class FavoriteSongsController < ApplicationController
  before_action :set_favorite_song, only: [:show, :edit, :update, :destroy]

  # GET /favorite_songs
  # GET /favorite_songs.json
  def index
    @favorite_songs = current_user.favorite_songs
  end

  # GET /favorite_songs/1
  # GET /favorite_songs/1.json
  def show
  end

  # GET /favorite_songs/new
  def new
    @favorite_song = FavoriteSong.new
  end

  # GET /favorite_songs/1/edit
  def edit
  end

  # POST /favorite_songs
  # POST /favorite_songs.json
  def create
    @favorite_song = current_user.favorite_songs.build(favorite_song_params)

    respond_to do |format|
      if @favorite_song.save
        format.html { redirect_to @favorite_song, notice: 'Favorite song was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_song }
      else
        format.html { render :new }
        format.json { render json: @favorite_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_songs/1
  # PATCH/PUT /favorite_songs/1.json
  def update
    respond_to do |format|
      if @favorite_song.update(favorite_song_params)
        format.html { redirect_to @favorite_song, notice: 'Favorite song was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite_song }
      else
        format.html { render :edit }
        format.json { render json: @favorite_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_songs/1
  # DELETE /favorite_songs/1.json
  def destroy
    @favorite_song.destroy
    respond_to do |format|
      format.html { redirect_to favorite_songs_url, notice: 'Favorite song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_song
      @favorite_song = FavoriteSong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_song_params
      params.require(:favorite_song).permit(:user_id, :song_id)
    end
end
