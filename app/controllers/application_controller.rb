
class ApplicationController < ActionController::Base

	# before_filter :initialize_token
	# def initialize_token
	# 	code=params[:code]
	# 	if code==nil
	# 		unless Foursquare_client.has_token?
	# 			redirect_to Foursquare_client.authorize_url
	# 		end
	# 	else
	# 		Foursquare_client.generate_client(code)
	# 	end 
	# end 	
  protect_from_forgery
  helper_method :current_user

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
