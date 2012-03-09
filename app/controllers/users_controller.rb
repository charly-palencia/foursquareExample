require "Foursquare2"
class UsersController < ApplicationController
	def search 
		#nothinhg to do here  
	end

	def find
		  @client_result=Foursquare_client.search_users(:mail=> "leonardo.sanclemente1@gmail.com")

	end
end
