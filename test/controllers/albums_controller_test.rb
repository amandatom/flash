# Author: Amanda Tom
# Last Updated: 14/11/2015
# This file tests the albums_controller functionality
require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase

  # setup the album to be used for testing
  setup do
    @album = albums(:test)
  end

  # tests GET index
  # Last modified: 14/11/2015
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:albums)
  end

  # tests GET new
  # Last modified: 14/11/2015
  test "should get new" do
    get :new
    assert_response :success
  end

  # tests POST create
  # Last modified: 14/11/2015
  test "should create album" do
    assert_difference('Album.count') do
      post :create, album: { created_date: @album.created_date, name: @album.name }
    end

    assert_redirected_to album_path(assigns(:album))
  end

  # tests GET id
  # Last modified: 14/11/2015
  test "should show album" do
    get :show, id: @album
    assert_response :success
  end

  # tests DELETE id
  # Last modified: 14/11/2015
  test "should destroy album" do
    assert_difference('Album.count', -1) do
      delete :destroy, id: @album
    end

    assert_redirected_to albums_path
  end
end
