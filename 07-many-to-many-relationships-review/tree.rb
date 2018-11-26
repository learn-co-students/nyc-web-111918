class Tree
  attr_accessor :branches, :leaves, :tallness

  @@all = []

  def self.all
    @@all
  end
                # Number   Number   Number
  def initialize(branches, leaves, tallness)
    @branches = branches
    @leaves = leaves
    @tallness = tallness

    @@all << self
  end

  def nests
    # Nest.all to look at all the nests
    Nest.all.select do |nest| # Nest instance
      # then look at nest.tree and compare to self
      nest.tree == self # I am a tree
    end
  end

  def squirrels
    # I need to search _through_ the NEST
    # look at everything in nests
      # This returns an array of my nests
    # create a list of trees from those nests
      # Loop over this array,
    self.nests.map do |nest| # map or collect <- literally do the same thing
      # Look at nest.squirrel,
      # Put that into a new array because they are instances
      nest.squirrel
    end
  end
end # end of Tree class
