require "Foursquare2"
class UsersController < ApplicationController
	def search 
		#nothinhg to do here  
	end

	def find

	end

	def badges
		@badges = Foursquare_client.get_badges_user(108914)
	end
end
