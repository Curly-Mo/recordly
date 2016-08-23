require 'test_helper'

class FavoriteArtistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_artist = favorite_artists(:one)
  end

  test "should get index" do
    get favorite_artists_url
    assert_response :success
  end

  test "should get new" do
    get new_favorite_artist_url
    assert_response :success
  end

  test "should create favorite_artist" do
    assert_difference('FavoriteArtist.count') do
      post favorite_artists_url, params: { favorite_artist: { artist_id: @favorite_artist.artist_id, user_id: @favorite_artist.user_id } }
    end

    assert_redirected_to favorite_artist_url(FavoriteArtist.last)
  end

  test "should show favorite_artist" do
    get favorite_artist_url(@favorite_artist)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorite_artist_url(@favorite_artist)
    assert_response :success
  end

  test "should update favorite_artist" do
    patch favorite_artist_url(@favorite_artist), params: { favorite_artist: { artist_id: @favorite_artist.artist_id, user_id: @favorite_artist.user_id } }
    assert_redirected_to favorite_artist_url(@favorite_artist)
  end

  test "should destroy favorite_artist" do
    assert_difference('FavoriteArtist.count', -1) do
      delete favorite_artist_url(@favorite_artist)
    end

    assert_redirected_to favorite_artists_url
  end
end
