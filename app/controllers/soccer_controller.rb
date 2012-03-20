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
				"image"=>"http://lh3.ggpht.com/avlZSzbiNYEFPmfN87cVzkmh9Z-2D53tHR8tBT7JhMPytvapW6wzOgrzuJpEtxqHXBoohR59SF9KaBNz=s48",
				"tittle"=>"you are here",
				"address"=>""	
			})
		
		venues=Foursquare_client.get_venues_by_category(params).groups[0].items 
		# raise venues.to_s
		venues.each do |venue|

			address = ""

			if(venue.location.address!=nil)
				address += venue.location.address
			end

			if(venue.location.crossStreet!=nil)
				address += ' '+venue.location.crossStreet
			end


			markups.push ({
				"lat"=> venue.location.lat, 
				"lng"=> venue.location.lng,
				"image"=>"http://aux4.iconpedia.net/uploads/983983355692885407.png",
				"tittle"=>venue.name,
				"address"=>address				
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
