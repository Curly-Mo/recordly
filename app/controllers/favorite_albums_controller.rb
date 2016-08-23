class FavoriteAlbumsController < ApplicationController
  before_action :set_favorite_album, only: [:show, :edit, :update, :destroy]

  # GET /favorite_albums
  # GET /favorite_albums.json
  def index
    @favorite_albums = current_user.favorite_albums
  end

  # GET /favorite_albums/1
  # GET /favorite_albums/1.json
  def show
  end

  # GET /favorite_albums/new
  def new
    @favorite_album = FavoriteAlbum.new
  end

  # GET /favorite_albums/1/edit
  def edit
  end

  # POST /favorite_albums
  # POST /favorite_albums.json
  def create
    @favorite_album = current_user.favorite_albums.build(favorite_album_params)

    respond_to do |format|
      if @favorite_album.save
        format.html { redirect_to @favorite_album, notice: 'Favorite album was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_album }
      else
        format.html { render :new }
        format.json { render json: @favorite_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_albums/1
  # PATCH/PUT /favorite_albums/1.json
  def update
    respond_to do |format|
      if @favorite_album.update(favorite_album_params)
        format.html { redirect_to @favorite_album, notice: 'Favorite album was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite_album }
      else
        format.html { render :edit }
        format.json { render json: @favorite_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_albums/1
  # DELETE /favorite_albums/1.json
  def destroy
    @favorite_album.destroy
    respond_to do |format|
      format.html { redirect_to favorite_albums_url, notice: 'Favorite album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_album
      @favorite_album = FavoriteAlbum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_album_params
      params.require(:favorite_album).permit(:user_id, :album_id)
    end
end
