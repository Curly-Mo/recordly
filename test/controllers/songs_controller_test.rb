require 'test_helper'
include Warden::Test::Helpers

class SongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @song = songs(:one)
  end

  test "should get index" do
    @user = users(:one)
    login_as(@user)
    get songs_url
    assert_response :success

    logout
    get songs_url
    assert_equal 302, status 
  end

  test "should get new" do
    @user = users(:one)
    login_as(@user)
    get new_song_url
    assert_response :success

    logout
    get new_song_url
    assert_equal 302, status 
  end

  test "should create song" do
    @user = users(:one)
    login_as(@user)
    assert_difference('Song.count') do
      post songs_url, params: { song: { album_id: @song.album_id, title: 'NewSong' } }
    end

    assert_redirected_to song_url(Song.last)
  end

  test "should show song" do
    @user = users(:one)
    login_as(@user)
    get song_url(@song)
    assert_response :success

    logout
    get song_url(@song)
    assert_equal 302, status 
  end

  test "should get edit" do
    @user = users(:one)
    login_as(@user)
    get edit_song_url(@song)
    assert_response :success

    logout
    get edit_song_url(@song)
    assert_equal 302, status 
  end

  test "should update song" do
    @user = users(:one)
    login_as(@user)
    patch song_url(@song), params: { song: { album_id: @song.album_id, title: @song.title } }
    assert_redirected_to song_url(@song)
  end

  test "should destroy song" do
    @user = users(:one)
    login_as(@user)
    assert_difference('Song.count', -1) do
      delete song_url(@song)
    end

    assert_redirected_to songs_url
  end
end
