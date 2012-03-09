require "Foursquare2"
class UsersController < ApplicationController
	def search 
		#nothinhg to do here  
	end

	def find
		@users=Foursquare_client.get_users(params)
	end

	def badges
		@badges = Foursquare_client.get_badges_user(108914)
	end

	def friends 
		
	end 
end
