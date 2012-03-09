
require "Foursquare2"
require 'oauth2'
class FoursquareAdapter

	Id="QLU245BWOICOUJT2MVWBIDAB3VG2EFHEZFDXR5ECTOOQZ0Y4"
	Secret="YLVJOAKMW4TIVQBESMBSRZE0BTBW4PYK3X30RUPWDIO2EE3T"
	attr_accessor :token

	def initialize
		@client = OAuth2::Client.new(Id, Secret, :site => 'https://foursquare.com/', :authorize_url=> "oauth2/authenticate")
		
	end

	def authorize_url
		@client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3000/')
	end 

	def has_token?
		@token!=nil
	end 

	def generate_client (oauth_code)
		@token= @client.auth_code.get_token(oauth_code)
		@client_foursquare=Foursquare2::Client.new(:client_id => id, :client_secret => secret, :token=>@token)
	end


end  