# Author: Amanda Tom
# Last Updated: 04/11/2015
# This file defines the Photo class
class Photo < ActiveRecord::Base
	# set file uploader
	mount_uploader :filename, FilenameUploader
	# require a title, filename, and created_date
	validates :title, presence: true
	validates :created_date, presence: true
	validates :filename, presence: true
	# linked to Album via foreign key
	belongs_to :album
end
