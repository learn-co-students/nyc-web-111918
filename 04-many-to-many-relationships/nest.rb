class Nest
  attr_accessor :size
  attr_reader :squirrel, :tree

  @@all = []
                # Number, Squirrel instance, Tree instance
  def initialize(size, squirrel, tree)
    @size = size
    @squirrel = squirrel
    @tree = tree

    @@all << self
  end

  def self.all
    @@all
  end

  def delete
    @@all.delete(self)
  end
end # end of Nest class
