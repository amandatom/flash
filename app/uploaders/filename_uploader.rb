# Author: Amanda Tom
# Last Updated: 19/10/2015
# This class is used to upload files to the application. It uses the CarrierWave gem.
class FilenameUploader < CarrierWave::Uploader::Base
  # allows MiniMagick to be used to manipulate images
  include CarrierWave::MiniMagick
  storage :file

  # creates a 300 x 300 thumbnail version of the uploaded image when :thumb is used
  version :thumb do |t|
    process :resize_to_fill => [300, 300]
  end

  # defines the directory where files are stored after upload
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # defines the allowable file types that can be uploaded
  def extension_white_list
  	%w(jpg jpeg gif png)
  end
end
