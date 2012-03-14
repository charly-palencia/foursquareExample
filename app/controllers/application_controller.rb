
class ApplicationController < ActionController::Base

	before_filter :initialize_token
	def initialize_token
		code=params[:code]
		puts code
		if code==nil
			unless Foursquare_client.has_token?
				redirect_to Foursquare_client.authorize_url
			end
		else
			Foursquare_client.generate_client(code)
		end 
	end 	
  protect_from_forgery
end
