class Like
  attr_reader :user, :tweet

  @@all = []

  def initialize(user, tweet)
    @user = user
    @tweet = tweet

    @@all << self
  end

  def self.all
    @@all
  end
end # end of Like class
