 require "google_static_maps_helper"
 class GmapsClient
 	def getGmapsImage (latitude, longitude)
 		#map
 		map = GoogleStaticMapsHelper::Map.new(:sensor => false,
                                      :size => '640x640',
                                      :center => '6.216543035127193, -75.5766248703003',
                                      :zoom => 15)
 	# 	#path
 	# 	start_point = {:lat => 1, :lng => 2} # You can also use any object which responds to lat and lng here
		# end_point = {:lat => 1, :lng => 2}
		# path << start_point << end_point
		# map << path

 		#url
		map.url
 	end 
 end 