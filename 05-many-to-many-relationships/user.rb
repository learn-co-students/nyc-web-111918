class User
  attr_reader :username #, :tweets

  @@all = []

  def initialize(username)
    @username = username
    # @tweets = [] # this is the bad way
  end

  def post_tweet(message)
    Tweet.new(message, self)
    # this was required to do it the bad way
    # @tweets << my_tweet
  end

  def tweets
    # bad way made this easy, but made the reverse very hard
    # @tweets
    # instead, calculate it like so:
    Tweet.all.select do |tweet|
      tweet.user == self
    end
  end

  def liked_tweets # why can't we name this tweets?
    # return the tweets this user liked
    # find out the relationships for me and the tweets I like
    my_likes = Like.all.select do |like|
      like.user == self
    end

    # then from that relationship, pull out the tweets
    my_likes.map do |like|
      like.tweet
    end
  end

  # that accepts as a tweet instance as a parameter
                 # Tweet instance
  def like_tweet(tweet) #instance method
    # u1.like_tweet(t3)
    Like.new(self, tweet)
  end

end
