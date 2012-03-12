
class UsersController < ApplicationController
	def search 
		#nothinhg to do here  
	end

	def find
		@users=Foursquare_client.get_users(params)
	end

	def badges
		user_id = params[:id]
		@badges = Foursquare_client.get_badges_user(user_id)
	end

	def friends 
		user_id = params[:id]
		@friends = Foursquare_client.get_friends_user(user_id)
	end 
end
