class Api::V1::UserBotsController < ApplicationController
  def create
    @user_bot = UserBots.new(
      user_id: params[:user_id],
      bot_id: params[:bot_id]
    )

    if @user_bot.save
      render json: @user_bot
    else
      render json: {errors: @user_bot.errors.full_messages}
    end
  end
end