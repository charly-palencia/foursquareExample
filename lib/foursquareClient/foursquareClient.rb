
require "Foursquare2"
require 'oauth2'
class FoursquareAdapter

	Id="QLU245BWOICOUJT2MVWBIDAB3VG2EFHEZFDXR5ECTOOQZ0Y4"
	Secret="YLVJOAKMW4TIVQBESMBSRZE0BTBW4PYK3X30RUPWDIO2EE3T"
	attr_accessor :token

	def initialize
		@client = OAuth2::Client.new(Id, Secret, :site => 'https://foursquare.com/', :authorize_url=> "oauth2/authenticate", 
			:token_url=> "oauth2/access_token" )
		
	end

	def authorize_url
		@client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3000/')
	end 

	def has_token?
		@token!=nil
	end 

	def generate_client (oauth_code)
		p "codigo aqui :"+oauth_code
		@token= @client.auth_code.get_token(oauth_code, :redirect_uri => 'http://localhost:3000/', :grant_type=> "authorization_code")
		# @token= @client.auth_code.get_token(gets.chomp, :redirect_uri => 'http://localhost:3000/')
		@client_foursquare=Foursquare2::Client.new( :oauth_token=>@token.token)
		p @client_foursquare.search_users(:email=> "leonardo.sanclemente1@gmail.com")

	end


end  