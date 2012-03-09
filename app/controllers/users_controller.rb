require "Foursquare2"
class UsersController < ApplicationController
	def search 
		#nothinhg to do here  
	end

	def find
		  id="W1QHGIGWGNH31NALAWTGLYFV4DI0TZDFDZXHTYTK2WICF35Z"
	      secret="TUKNPEXOJET2MXPROWOBHCGHLVJDMU20UO3ODLIV2V1ALEGA"

		  client= Foursquare2::Client.new(:client_id => id, :client_secret => secret)
		  #client= Foursquare2::Client.new(:oauth_token => 'OXoxZkmkAmpi1iVw1HLp5MF7WdpcpkAES6Mzxck/zG4=')
		  @token = client.search_users(:email => 'leonardo.sanclemente1@gmail.com')

	end
end
