# Author: Amanda Tom
# Last Updated: 04/11/2015
# This file defines the Photo class
class Album < ActiveRecord::Base
	# require a name and created_date
	validates :name, presence: true
	validates :created_date, presence: true
	# linked to Photo via foreign key
	has_many :photos
end
