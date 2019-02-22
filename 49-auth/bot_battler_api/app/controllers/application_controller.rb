class ApplicationController < ActionController::API

	# Copy and paste me - I'm always the same! Just remember to change the super_secret_key!

	# If you want to authorize a route (i.e. make the curr_user method work), simply add an "Authorization" header to your request!!!!
	def encode_token(user_id)
		JWT.encode({user_id: user_id}, "super_secret_key")
	end

	def token
		request.headers["Authorization"]
	end

	def decode_token
		begin
			JWT.decode(token, "super_secret_key")[0]["user_id"]
		rescue
			nil
		end
	end

	def curr_user
		User.find_by(id: decode_token)
	end
end
