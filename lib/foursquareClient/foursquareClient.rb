
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
		@token= @client.auth_code.get_token(oauth_code, :redirect_uri => 'http://localhost:3000/', :grant_type=> "authorization_code")
		@client_foursquare= Foursquare2::Client.new(:oauth_token=> @token.token)
	end

	def get_badges_user(user_id)
		badges = @client_foursquare.user_badges(user_id)
	end

	def get_users(options)
		@client_foursquare.search_users(options)
	end

	def get_venues(options)
		@client_foursquare.search_venues(options)
	end

	def get_friends_user(user_id,)
		@client_foursquare.user_friends(user_id)
	end

	def get_tips(id, options)
		@client_foursquare.venue_tips(id, options)
	end



end  