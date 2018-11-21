class Squirrel
  attr_accessor :tail

  @@all = []
                # String - bushy or not bushy
  def initialize(tail)
    @tail = tail

    @@all << self
  end

  def self.all
    @@all
  end

  def nests
    Nest.all.select do |nest|
      nest.squirrel == self
    end
  end

  def trees
    # look at my nests => array of nests (squirrel, tree)
    nests.map do |nest|
      nest.tree
    end
    # to find my trees => an array of trees
  end

end # end of Squirrel class
