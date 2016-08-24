require 'test_helper'
include Warden::Test::Helpers

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @album = albums(:one)
  end

  test "should get index" do
    @user = users(:one)
    login_as(@user)
    get albums_url
    assert_response :success

    logout
    get albums_url
    assert_equal 302, status 
  end

  test "should get new" do
    @user = users(:one)
    login_as(@user)
    get new_album_url
    assert_response :success

    logout
    get new_album_url
    assert_equal 302, status 
  end

  test "should create album" do
    @user = users(:one)
    login_as(@user)
    assert_difference('Album.count') do
      post albums_url, params: { album: { artist_id: @album.artist_id, title: 'NewAlbum' } }
    end

    assert_redirected_to album_url(Album.last)
  end

  test "should show album" do
    @user = users(:one)
    login_as(@user)
    get album_url(@album)
    assert_response :success

    logout
    get album_url(@album)
    assert_equal 302, status 
  end

  test "should get edit" do
    @user = users(:one)
    login_as(@user)
    get edit_album_url(@album)
    assert_response :success

    logout
    get edit_album_url(@album)
    assert_equal 302, status 
  end

  test "should update album" do
    @user = users(:one)
    login_as(@user)
    patch album_url(@album), params: { album: { artist_id: @album.artist_id, title: @album.title } }
    assert_redirected_to album_url(@album)
  end

  test "should destroy album" do
    @user = users(:one)
    login_as(@user)
    assert_difference('Album.count', -1) do
      delete album_url(@album)
    end

    assert_redirected_to albums_url
  end
end
