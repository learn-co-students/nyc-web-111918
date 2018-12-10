class Song
  @@all = []
  attr_accessor :title

  def initialize(title)
    @title = title
    self.class.all << self
  end

  def self.all
    @@all
  end
end
