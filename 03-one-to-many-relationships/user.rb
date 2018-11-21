class User
  attr_reader :username

  # the attributes
  # what to initialize
  # `#initialize` which takes a username and has a reader method for the username
  def initialize(username)
    @username = username
  end

  # def username
  #   @username
  # end

  # returns the array of Tweet instances for this user
  # that returns an array of Tweet instances
  def tweets
    # binding.pry
    # An Array of Tweet instances
    # Tweet.all.select do |tweet| # Tweet instance
    #   # compare this user and the tweet's user
    #   # User instance     # User instance
    #   tweet.user     ==   self
    #   # self == tweet.user
    # end
    # we need to look at all the Tweets

    Tweet.all.select do |tweet|
      tweet.user == self
    end
  end

  def post_tweet(message)
    # that takes a message,
    # creates a new tweet,
            # message, user
            # String   User instance
    Tweet.new(message, self)
    # and adds it to the user's tweet collection
  end

end # end of User class
