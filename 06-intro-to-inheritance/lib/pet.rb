class Pet
  attr_reader :name # defensive programming
  attr_accessor :mood

  @@all = []

  def initialize(name, mood = "nervous")
    # super
    # binding.pry
    puts "initialiae in PET"
    @name = name
    @mood = mood

    @@all << self
  end

  def self.all
    @@all
  end

  def fed
    puts "Feed me! I'm #{@name}!"
  end
end
