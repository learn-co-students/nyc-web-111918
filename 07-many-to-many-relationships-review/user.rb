class User
  attr_reader :username #, :tweets

  @@all = []
  
  def initialize(usernmae)
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

end
