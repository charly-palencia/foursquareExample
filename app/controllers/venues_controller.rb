class VenuesController < ApplicationController
	def search 
		#nothinhg to do here  
	end

	def find 
		if params[:llAcc] == ""
			params[:llAcc] = 0
		end
		if params[:alt] == ""
			params[:alt] = 0
		end
		params[:limit] = 10
		@venues=Foursquare_client.get_venues(params)
	end

	def tips
		parameters = Hash.new(0)
		parameters[:sort] = "recent"
		parameters[:limit] = 100
		@tips = Foursquare_client.get_tips(params[:id], parameters)
	end
end
