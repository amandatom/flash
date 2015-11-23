# Author: Amanda Tom
# Last Updated: 23/11/2015
# This file tests the photos_controller functionality

# default require statement for test cases
require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  # setup the user to be used for testing
  setup do
    @user = users(:test)
  end

  # tests GET index
  # Last modified: 23/11/2015
  test "should get index" do
    get :index
    assert_response :success
  end

  # tests GET new
  # Last modified: 23/11/2015
  test "should get new" do
    get :new
    assert_response :success
  end

  # tests POST create
  # Last modified: 23/11/2015
  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { name: "username", password: "password", password_confirmation: "password"}
    end

    assert_redirected_to user_path(assigns(:user))
  end

  # tests DELETE id
  # Last modified: 23/11/2015
  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
