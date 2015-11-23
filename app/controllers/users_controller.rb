# Author: Amanda Tom
# Last Updated: 23/11/2015
# This file defines all of the methods for Users
class UsersController < ApplicationController

  # action for GET index
  # Last modified: 23/11/2015
  def index
    # authenticate user

  end

  # action for GET new
  # Last modified: 19/11/2015
  def new
    # initialize new User object
    @user = User.new
  end

  # action for POST create
  # Last modified: 19/11/2015
  def create
    # initialize new User object with given parameters
    @user = User.new(user_params)
    # give notice if user save was successful or not
    respond_to do |format|
      if @user.save
        format.html { redirect_to albums_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # action for DELETE id
  # Last modified: 29/11/2015
  def destroy
    # find user from given id
    @user = User.find(params[:id])
    # destroy the given user
    @user.destroy
    # display notice if successful
    respond_to do |format|
      format.html { redirect_to albums_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # parameters that are required by User model
    # private so that attributes are protected from incorrect assignment
    # Last modified: 19/11/2015
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
