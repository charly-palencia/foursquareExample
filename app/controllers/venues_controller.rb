require "GmapsClient"
class VenuesController < ApplicationController

	def find		

		if params[:llAcc] == ""
			params[:llAcc] = 0
		end
		if params[:alt] == ""
			params[:alt] = 0
		end
		params[:limit] = 10
		ll=params[:ll]
		@venues=Foursquare_client.get_venues(params).groups[0].items
	
		@image_gmaps=GmapsClient.new.getGmapsImage(ll, @venues)
		render :layout => false
	end	

	def tips
		parameters = Hash.new(0)
		parameters[:sort] = "recent"
		parameters[:limit] = 100
		@tips = Foursquare_client.get_tips(params[:id] , parameters).items
		render :layout => false
	end
end
