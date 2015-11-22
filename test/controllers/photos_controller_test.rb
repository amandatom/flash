# Author: Amanda Tom
# Last Updated: 14/11/2015
# This file tests the photos_controller functionality

# default require statement for test cases
require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  # setup the photo to be used for testing
  setup do
    @photo = photos(:test)
  end

  # file uploader for the test
  # Last modified: 01/11/2015
  def upload_fixture_file filename, content_type
      ActionDispatch::Http::UploadedFile.new({
        :filename => filename,
        :content_type => content_type,
        :tempfile => File.new("#{Rails.root}/test/fixtures/files/" + filename)
                                             })
  end

  # tests POST create
  # Last modified: 14/11/2015
  test "should create photo" do
    file = upload_fixture_file 'test.png', "image/png"
    assert_difference("Photo.count") do
      post :create, photo: {title: "Test", created_date: "11/01/2015", filename: file, album_id: 1} 
    end
  end
  
  # tests DELETE id
  # Last modified: 14/11/2015
  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      delete :destroy, id: @photo
    end

    assert_redirected_to photos_path
  end
end
