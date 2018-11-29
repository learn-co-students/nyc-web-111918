class Tweet
  attr_accessor :message, :username
  ALL = []

  def self.all
    ALL
  end

  def initialize(props={})
    @message = props['message']
    @username = props['username']
    ALL << self
  end
end
