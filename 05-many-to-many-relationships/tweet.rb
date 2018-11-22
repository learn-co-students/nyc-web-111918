class Tweet
  attr_reader :message, :user

  @@all = []

  def initialize(message, user)
    @message = message
    @user = user

    @@all << self
  end

  def self.all
    @@all
  end

  def username
    @user.username
  end

  def likers
    # go through that join table, find dem relationships!
    my_likes = Like.all.select do |like|
      like.tweet == self
    end

    my_likes.map do |like|
      like.user
    end
  end
end
