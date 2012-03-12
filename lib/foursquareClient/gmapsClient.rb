 require "google_static_maps_helper"
 class GmapsClient
 	def getGmapsImage (ll, places)
 		#map
 		map = GoogleStaticMapsHelper::Map.new(:sensor => false,
                                      :size => '640x640',
                                      :center => ll,
                                      :zoom => 17)
 		#markers
 		for place in places 
 			if (place.location!=nil && place.location.lat!=nil && place.location.lng!=nil)
	 			marker = GoogleStaticMapsHelper::Marker.new(:lng => place.location.lng, :lat => place.location.lat, 
	 				:color => 'green', :label => "S")
	 			map << marker	
 			end 
 		end
 		

 		#url
		map.url
 	end 
 end 