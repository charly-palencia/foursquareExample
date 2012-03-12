 require "google_static_maps_helper"
 class GmapsClient
 	def getGmapsImage (latitude, longitude)
 		#map
 		map = GoogleStaticMapsHelper::Map.new(:sensor => false,
                                      :size => '200x300',
                                      :center => '2,2',
                                      :zoom => 4)
 	# 	#path
 	# 	start_point = {:lat => 1, :lng => 2} # You can also use any object which responds to lat and lng here
		# end_point = {:lat => 1, :lng => 2}
		# path << start_point << end_point
		# map << path

 		#url
		map.url
 	end 
 end 