
class UsersController < ApplicationController
	def search 
	end

	def find
		@users=Foursquare_client.get_users(params)
		render :layout => false
	end

	def badges
		user_id = params[:id]
		@badges = Foursquare_client.get_badges_user(user_id)
		render :layout => false
	end

	def friends 
		user_id = params[:id]
		@friends = Foursquare_client.get_friends_user(user_id)
		render :layout => false
	end 
end
