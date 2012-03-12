 require "googlestaticmap"
 class GmapsClient
 	def getGmapsImage (latitude, longitude)
 		map = GoogleStaticMap.new(:zoom => 11, :center => MapLocation.new(:latitude => latitude, :longitude => longitude))
  		map.markers << MapMarker.new(:color => "green", :location => MapLocation.new(:latitude => latitude, :longitude => longitude))
  		image = map.get_map
 	end 
 end 