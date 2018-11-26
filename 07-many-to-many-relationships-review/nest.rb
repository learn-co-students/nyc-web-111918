class Nest
  # Master Splinter - your would ask your boss
  attr_reader :tree, :squirrel # What are these two doing for us?
  attr_accessor :size, :material

  @@all = []

  def self.all
    @@all
  end

  # How do you decide what they can initialize with?
  # => Whatever is easiest to start
  # => YES! Red, Green, Refactor like crazy!
  def initialize(tree, squirrel, size, material)
    @tree = tree
    @squirrel = squirrel
    @size = size
    @material = material

    @@all << self
    # self.class.all << self
  end

end # end of Nest class
