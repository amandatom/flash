# Author: Amanda Tom
# Last Updated: 17/11/2015
# This file defines the User class
class User < ActiveRecord::Base
	# require a unique name with maximum length of name is 12 characters (give error if too long)
	validates :name, presence: true, uniqueness: true, length: {maximum: 12, too_long: "%{count} characters is the maximum allowed."}
	# use Rails method to ensure a secure password
	# saves a hashed password_digest attribute
	# provides virtual attributes (password and password_confirmation)
	# provides a authenticate method that returns the user when the password is correct
	has_secure_password
	# require a password with minimum length of 6 characters, and not just spaces
	validates :password, presence: true, length: {minimum: 6, too_short: "%{count} characters is the minimum allowed."}
end
