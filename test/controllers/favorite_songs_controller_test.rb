require 'test_helper'
include Warden::Test::Helpers

class FavoriteSongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_song = favorite_songs(:one)
  end

  test "should get index" do
    @user = users(:one)
    login_as(@user)
    get favorite_songs_url
    assert_response :success
  end

  test "should get new" do
    @user = users(:one)
    login_as(@user)
    get new_favorite_song_url
    assert_response :success
  end

  test "should create favorite_song" do
    @user = users(:one)
    login_as(@user)
    assert_difference('FavoriteSong.count') do
      post favorite_songs_url, params: { favorite_song: { song_id: @favorite_song.song_id, user_id: @favorite_song.user_id } }
    end

    assert_redirected_to favorite_song_url(FavoriteSong.last)
  end

  test "should show favorite_song" do
    @user = users(:one)
    login_as(@user)
    get favorite_song_url(@favorite_song)
    assert_response :success
  end

  test "should get edit" do
    @user = users(:one)
    login_as(@user)
    get edit_favorite_song_url(@favorite_song)
    assert_response :success
  end

  test "should update favorite_song" do
    @user = users(:one)
    login_as(@user)
    patch favorite_song_url(@favorite_song), params: { favorite_song: { song_id: @favorite_song.song_id, user_id: @favorite_song.user_id } }
    assert_redirected_to favorite_song_url(@favorite_song)
  end

  test "should destroy favorite_song" do
    @user = users(:one)
    login_as(@user)
    assert_difference('FavoriteSong.count', -1) do
      delete favorite_song_url(@favorite_song)
    end

    assert_redirected_to favorite_songs_url
  end
end
