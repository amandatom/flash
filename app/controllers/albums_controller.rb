# Author: Amanda Tom
# Last Updated: 13/11/2015
# This file defines all of the methods for Photos
class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :destroy]

  # action for GET index
  # Last modified: 09/11/2015
  def index
    # select all Albums from db
    @albums = Album.all
  end

  # action for GET id
  # Last modified: 11/11/2015
  def show
    # if it doesn't exist, set notice
    if @album.nil?
      redirect_to albums_path, notice: "That album does not exist!"
    end
  end

  # action for GET new
  # Last modified: 07/11/2015
  def new
    # initialize new Album object
    @album = Album.new
  end

  # action for POST create
  # Last modified: 07/11/2015
  def create
    # initialize new Album object with given parameters
    @album = Album.new(album_params)
    # give a notice if album save was successful or not
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # action for DELETE id
  # Last modified: 13/11/2015
  def destroy
    # destroy the given album
    @album.destroy
    # display notice if successful
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # parameters that are required by Album model
    # private so that attributes are protected from incorrect assignment
    # Last modified: 07/11/2015
    def album_params
      params.require(:album).permit(:name, :created_date)
    end
end
