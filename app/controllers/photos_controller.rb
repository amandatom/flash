# Author: Amanda Tom
# Last Updated: 02/11/2015
# This file defines all of the methods for Photos
class PhotosController < ApplicationController
  # action for GET index
  # Last modified: 26/10/2015
  def index
    # select all Photos from db
    @photos = Photo.all
  end

  # action for GET id
  # Last modified: 28/10/2015
  def show
    # find specific Photo by id given
    @photo = Photo.find_by_id(params[:id])
    # if it doesn't exist, set notice
    if @photo.nil?
      redirect_to photos_path, notice: "That photo does not exist!"
    end
  end

  # action for GET new
  # Last modified: 02/11/2015
  def new
    @album = Album.find(params[:album_id])
    # initialize new Photo object
    @photo = Photo.new(album_id: params[:album_id])
  end

  # action for POST create
  # Last modified: 02/11/2015
  def create
    # initialize new Photo with given parameters
    @photo = Photo.new(photo_params)
    # if save is successful
    if @photo.save
      @album = @photo.album_id
      # return to index, produce notice
      redirect_to album_path(@album), notice: "The photo #{@photo.title} has been uploaded."
    # save is unsuccessful
    else
      # refresh new
      render "new"
    end
  end

  # action for DELETE id
  # Last modified: 30/10/2015
  def destroy
    # find specific photo by id given
    @photo = Photo.find(params[:id])
    # destroy the photo
    @photo.destroy
    # redirect to index, produce notice
    redirect_to photos_path, notice: "The photo #{@photo.title} has been deleted."
  end

  # action for GET id/edit
  def edit
    # not implemented yet
  end

  # action for PUT id
  def update
    # not implemented yet
  end

  private
  # parameters that are required by Photo model
  # private so that attributes are protected from incorrect assignment
  # Last modified: 02/11/2015
  def photo_params
    # require title, created_date, and filename
    params.require(:photo).permit(:title, :created_date, :album_id, :filename)
  end
end
