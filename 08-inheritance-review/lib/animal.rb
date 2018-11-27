class Animal < Amammal
  attr_reader :name
  attr_accessor :mood
  # let's make things readers first
  # Defensive Programming

  @@all = []

  def initialize(name)
    @name = name
    @mood = "nervous"

    @@all << self
  end

  def self.all
    @@all
  end
  # def self.all
  #   @@all.select do |instance|
  #     instance.class == self
  #   end
  # end

  def eat(food)
    puts "I can eat #{food}."
    binding.pry # self <== know the context of who called this
  end

  def walk
    puts "omg rabbit hole"
  end

  # def amammal_method
  #   "something else?"
  # end
end # end of Animal class
