class ApplicationController < ActionController::Base

	before_filter :initialize_token
	def initialize_token
		
		unless Foursquare_client.has_token?
			redirect_to Foursquare_client.authorize_url
		end
	end 	
  protect_from_forgery
end
