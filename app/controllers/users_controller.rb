require "Foursquare2"
class UsersController < ApplicationController
	def search 
		#nothinhg to do here  
	end

	def find
		@users=Foursquare_client.get_users(params)

	end

	def friends 
		
	end 
end
