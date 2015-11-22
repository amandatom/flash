# Author: Amanda Tom
# Last Updated: 14/11/2015
# This file specifies the default configuration to run tests of the Album model
require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test to determine if model can be used to create object with all attributes defined
	test "create album" do
		album = Album.new(name: "Test Album", created_date: "11/11/2015")
		assert album.save
	end

	# test if object can be created without name
	test "create album without name" do
		album = Album.new(created_date: "11/11/2015")
		assert_not album.save
	end

	# test if object can be created without created_date
	test "create album without created_date" do
		album = Album.new(name: "Test Album")
		assert_not album.save
	end
end
