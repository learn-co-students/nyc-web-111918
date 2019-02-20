class TweetsController < ApplicationController

  def create
    tweet = Tweet.new(content: params[:content], feed_id: 1)
    if tweet.save
      render json: tweet
    else
      render json: {error: 'Could not create that tweet'}, status: 422
    end
  end

end
