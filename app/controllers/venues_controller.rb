require "GmapsClient"
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
		coordenades=params[:ll].split(",")
		latitude=coordenades[0].strip
		longitude=coordenades[1].strip
		@image_gmaps=GmapsClient.new.getGmapsImage(latitude, longitude)
		@venues=Foursquare_client.get_venues(params)
	end

	def tips
		parameters = Hash.new(0)
		parameters[:sort] = "recent"
		parameters[:limit] = 100
		@tips = Foursquare_client.get_tips(params[:id] , parameters)
	end
end
