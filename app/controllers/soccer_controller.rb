class SoccerController < ApplicationController
	def find
		if params[:lat]== nil || params[:lng]==nil
			params[:lat]="10.98940092958238"
			params[:lng]="-74.7999849319458"
		end
		p params.to_s
		lat= params[:lat]
		lng= params[:lng]

		params[:ll]=lat+", "+lng
		markups=[]

		markups.push ({
				"lat"=> lat, 
				"lng"=> lng,
				"image"=>"../images/soccer-ball.png",
				"tittle"=>"NombreUser"
			})
		
		venues=Foursquare_client.get_venues_by_category(params).groups[0].items 
		# raise venues.to_s
		venues.each do |venue|
			markups.push ({
				"lat"=> venue.location.lat, 
				"lng"=> venue.location.lng,
				"image"=>"",
				"tittle"=>venue.name,
				"animation"=> "google.maps.AnimationDROP"
			})
		end
		json={"markups"=> markups}
		@results=JSON(json)
		# raise @results.to_yaml
		if params[:refresh]=="1"
			render :json => @results
		else 
			render :layout => "map"
		end
	end 
end
