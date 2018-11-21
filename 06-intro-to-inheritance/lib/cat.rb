class Cat < Pet



  # why is it not using the other initialize???
  # this is overwriting the parent class's initialize
  def initialize(name, mood = "nervous") # , other_stuff = "blah")
    # binding.pry
    puts "initiualize in CAT"
    # super(name, mood, other_stuff) ==> super
    # use super when you want to call the method in the parent
    # this parent could be a inherited class
    @sharp_claws = true
    puts @sharp_claws
    puts @name
    super(name, mood)

    @num_lives = 9
  end

  def fed
    super
    binding.pry
    # fed
    # look up chain
    # 1. looks for a local variable
    # 2. looks for a method to call on the self => self.fed
    # 3. look at the parent and try to run the method
    # keep going up and up and up until it crashes
    puts "Meow!"
  end

  def meow
    "Meow!"
  end

  extend Mammal::ClassMethods
  include Mammal::InstanceMethods::Inception
end
