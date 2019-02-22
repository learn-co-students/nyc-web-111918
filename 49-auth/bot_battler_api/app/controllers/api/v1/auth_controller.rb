class Api::V1::AuthController < ApplicationController
	def login
		@user = User.find_by(username: params[:username])

		if @user && @user.authenticate(params[:password])
			token = encode_token(@user.id)

			render json: {user: UserSerializer.new(@user), token: token}
		else
			render json: {errors: "WHOA! You dun goofed!"}
		end
	end

	def get_user_from_token
			if curr_user
				render json: curr_user
			else
				render json: {errors: "WHOA! User not found!"}
			end
	end
end