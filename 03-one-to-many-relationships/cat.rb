class Cat
  attr_reader :fur_color, :name
  attr_accessor :anger_level

  @@all = [] # Array of Cat instances

                # String    String  Number
  def initialize(fur_color, name, anger_level)
    @fur_color = fur_color
    @name = name
    @anger_level = anger_level

    @@all << self # storing a reference to the cat instance
  end

  def meow
    puts "Meeeeoow! I'm #{self.name}."
  end

  # Angry cats are willing to fight.
  def self.cat_army
    @@all.select do |cat|
      cat.anger_level > 7
    end
  end

  def self.all
    @@all
  end
end # end of Cat class
