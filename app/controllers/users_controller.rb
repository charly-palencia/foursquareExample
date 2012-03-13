
class UsersController < ApplicationController

	def find
		@users=Foursquare_client.get_users(params).results
		#Generate a full name for the users
		@users.each do |user| 
			if user.firstName!=nil
	   			name=user.firstName
	   		else 
	   			name=""
	   		end
	   		if user.lastName!=nil
	   			name+=" "+user.lastName
	   		end	
	   		user.name=name
		end 
		render :layout => false
	end

	def badges
		user_id = params[:id]
		#returns a hassie with arrays
		@badges= []
		array_badges = Foursquare_client.get_badges_user(user_id).badges
		array_badges.each do |array_badge|
			@badges.push array_badge[1]	
		end 
		# @badges=array_badges
		render :layout => false
	end

	def friends 
		user_id = params[:id]
		@friends = Foursquare_client.get_friends_user(user_id).items
		render :layout => false
	end 
end
