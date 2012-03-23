class SessionsController < ApplicationController
	def create 
		raise request.env["omniauth.auth"].to_yaml
		# auth = request.env["omniauth.auth"]
		# user = User.find_by_provider_and_uid(auth["provider"],auth["uid"]) || User.create_with_omniauth(auth)
		# session[:user_id] = user.id
		# session[:user] = user
		# redirect_to soccer_find_path
	end 

	def destroy
		session[:user_id] = nil
		session[:user] = nil
		redirect_to root_url
	end
end
