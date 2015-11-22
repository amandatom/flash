# Author: Amanda Tom
# Last Updated: 04/11/2015
# This file tells the Rails router how to match URLs to controller actions and generates paths and URLs
Rails.application.routes.draw do
  # set up all of the common routes for the albums controller
  resources :albums
  # set up all of the common routes for the photos controller
  resources :photos
  # set the root of the application ('/') to the albums index.html.erb
  root "albums#index"
end
