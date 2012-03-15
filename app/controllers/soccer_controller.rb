class SoccerController < ApplicationController
	def find
		params[:ll]="6.2, -75.5766248703003"
		@markups=[]
		lat= params[:ll].split(",")[0]
		lng= params[:ll].split(",")[1]
		markup=Markup.new(:lat=> lat, :lng=> lng)
		@markups.push markup
		venues=Foursquare_client.get_venues_by_category(params) 
		venues.each do |venue|
			markup=Markup.new(:lat=> lat, :lng=> lng)
			@markups.push markup
		end
	end 
end
