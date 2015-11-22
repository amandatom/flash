# Author: Amanda Tom
# Last Updated: 14/11/2015
# This file specifies the default configuration to run tests of the Photo model
require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
	# test to determine if model can be used to create object with all attributes defined
	test "create photo" do
		photo = Photo.new(title: "Test Photo", created_date: "11/01/2015", :filename => File.open(Rails.root.join("test.png")))
		assert photo.save
	end

	# test if object can be created without title
	test "create photo without title" do
		photo = Photo.new(created_date: "11/01/2015", filename: File.open(Rails.root.join("test.png")))
		assert_not photo.save
	end

	# test if object can be created without created_date
	test "create photo without created_date" do
		photo = Photo.new(title: "Test Photo", filename: File.open(Rails.root.join("test.png")))
		assert_not photo.save
	end

	# test if object can be created without filename
	test "create photo without filename" do
		photo = Photo.new(title: "Test Photo", created_date: "11/01/2015")
		assert_not photo.save
	end
end
