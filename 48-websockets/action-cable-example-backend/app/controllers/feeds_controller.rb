class FeedsController < ApplicationController

  def show
    feed = Feed.find_by(id: params[:id])

    if feed
      render json: {tweets: feed.tweets}
    else
      render json: {error: 'That feed does not exist'}, status: 404
    end
  end

end
