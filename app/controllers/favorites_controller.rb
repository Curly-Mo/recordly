class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /favorites
  # GET /favorites.json
  def index
    @favorite_artists = current_user.favorite_artists
    @favorite_albums = current_user.favorite_albums
    @favorite_songs = current_user.favorite_songs
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
  end

end
