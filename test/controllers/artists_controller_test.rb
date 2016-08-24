require 'test_helper'
include Warden::Test::Helpers

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artist = artists(:one)
  end

  test "should get index" do
    @user = users(:one)
    login_as(@user)
    get artists_url
    assert_response :success

    logout
    get artists_url
    assert_equal 302, status 
  end

  test "should get new" do
    @user = users(:one)
    login_as(@user)
    get new_artist_url
    assert_response :success

    logout
    get new_artist_url
    assert_equal 302, status 
  end

  test "should create artist" do
    @user = users(:one)
    login_as(@user)
    assert_difference('Artist.count') do
      post artists_url, params: { artist: { name: 'NewArtist' } }
    end

    assert_redirected_to artist_url(Artist.last)
  end

  test "should show artist" do
    @user = users(:one)
    login_as(@user)
    get artist_url(@artist)
    assert_response :success

    logout
    get artist_url(@artist)
    assert_equal 302, status 
  end

  test "should get edit" do
    @user = users(:one)
    login_as(@user)
    get edit_artist_url(@artist)
    assert_response :success

    logout
    get edit_artist_url(@artist)
    assert_equal 302, status 
  end

  test "should update artist" do
    @user = users(:one)
    login_as(@user)
    patch artist_url(@artist), params: { artist: { name: @artist.name } }
    assert_response :success
    #assert_redirected_to artist_url(@artist)
  end

  test "should destroy artist" do
    @user = users(:one)
    login_as(@user)
    assert_difference('Artist.count', -1) do
      delete artist_url(@artist)
    end

    assert_redirected_to artists_url
  end
end
