class Tweet
  # what are the attributes of a tweet?
  attr_reader :message, :user #, :username <= not an attribute

  @@all = [] # so we can teach you about databases

  # username? is this an attribute?
  # we can get it from the user
  # Being really really inefficient.
  # breaking Single Source of Truth
  def initialize(message, user)
    @message = message
    @user = user # this was a User instance

    @@all << self
  end

  # SADLY NO!
  def self.all
    @@all
  end

  def username
    @user.username
  end
end # end of Tweet class
