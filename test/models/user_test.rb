# Author: Amanda Tom
# Last Updated: 23/11/2015
# This file specifies the default configuration to run tests of the User model
require 'test_helper'

class UserTest < ActiveSupport::TestCase

    # setup the user to be used for testing
  setup do
    @user = users(:test)
  end

  # test to determine if model can be used to create object with all attributes defined
	test "create user" do
		user = User.new(name: "user1", password: "password", password_confirmation: "password")
		assert user.save
	end

	# test if object can be created without name
	test "create user without name" do
		user = User.new(password: "password", password_confirmation: "password")
		assert_not user.save
	end

	# test if name length is not too long
	test "name should not be too long" do
		user = User.new(name: "1234567890123", password: "password", password_confirmation: "password")
		assert_not user.save
	end

	# test if name is unique
	test "name should be unique" do
		user = @user.dup
		assert_not user.save
	end

	# test if object can be created without password
  test "create user without password" do
    user = User.new(name: "user2")
    assert_not user.save
  end

  # test if password is not blank (whitespace)
  test "password should be not blank" do
    user = User.new(name: "user3", password: "      ", password_confirmation: "      ")
    assert_not user.save
  end

  # test if password is not too short
  test "password should not be too short" do
    user = User.new(name: "user4", password: "1234", password_confirmation: "1234")
    assert_not user.save
  end
end
