require 'test_helper'

class FavoriteAlbumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_album = favorite_albums(:one)
  end

  test "should get index" do
    @user = users(:one)
    login_as(@user)
    get favorite_albums_url
    assert_response :success
  end

  test "should get new" do
    @user = users(:one)
    login_as(@user)
    get new_favorite_album_url
    assert_response :success
  end

  test "should create favorite_album" do
    @user = users(:one)
    login_as(@user)
    assert_difference('FavoriteAlbum.count') do
      post favorite_albums_url, params: { favorite_album: { album_id: @favorite_album.album_id, user_id: @favorite_album.user_id } }
    end

    assert_redirected_to favorite_album_url(FavoriteAlbum.last)
  end

  test "should show favorite_album" do
    @user = users(:one)
    login_as(@user)
    get favorite_album_url(@favorite_album)
    assert_response :success
  end

  test "should get edit" do
    @user = users(:one)
    login_as(@user)
    get edit_favorite_album_url(@favorite_album)
    assert_response :success
  end

  test "should update favorite_album" do
    @user = users(:one)
    login_as(@user)
    patch favorite_album_url(@favorite_album), params: { favorite_album: { album_id: @favorite_album.album_id, user_id: @favorite_album.user_id } }
    assert_redirected_to favorite_album_url(@favorite_album)
  end

  test "should destroy favorite_album" do
    @user = users(:one)
    login_as(@user)
    assert_difference('FavoriteAlbum.count', -1) do
      delete favorite_album_url(@favorite_album)
    end

    assert_redirected_to favorite_albums_url
  end
end
