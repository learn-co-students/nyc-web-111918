class Squirrel
  attr_reader :color, :squishiness
  attr_accessor :anger_level

  @@all = []

  def self.all
    @@all
  end

  def initialize(color, squishiness, anger_level)
    @color = color
    @squishiness = squishiness
    @anger_level = anger_level

    @@all << self
  end

  def nests
    # Nest.all to look at all the nests
    Nest.all.select do |nest| # Nest instance
      # then look at nest.squirrel and compare to self
      nest.squirrel == self
    end
  end

  def trees
    # I need to search _through_ the NEST
    # look at everything in nests
      # This returns an array of my nests
    self.nests.map do |nest| # map or collect <- literally do the same thing
      # Look at nest.tree,
      # Put that into a new array because they are instances
      nest.tree
    end
    # create a list of trees from those nests
      # Loop over this array,
  end

  def average_tallness
    # the average tallness of the trees I built a nest in
  end

end # end of Squirrel class
