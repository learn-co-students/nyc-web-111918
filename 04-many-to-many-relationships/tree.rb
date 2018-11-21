class Tree
  attr_accessor :height, :trunk

  @@all = []
                # Number, Number
  def initialize(height, trunk)
    @height = height
    @trunk = trunk

    @@all << self
  end

  def self.all
    @@all
  end

  def nests
    Nest.all.select do |nest|
      nest.tree == self
    end
  end

  def squirrels
    nests.map do |nest|
      nest.squirrel
    end
  end
end # end of Tree class
