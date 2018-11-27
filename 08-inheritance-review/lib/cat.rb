class Cat < Animal # Single Inheritance
  # pulls in the code as class stuff
  extend AModuleName::ClassMethods
  # pull in the code as instance stuff
  include AModuleName::InstanceMethods

  def initialize(name)
    super(name)
    @lives = 9

    self.class.all << self
  end

  # this works


  def lands_on_feet
    puts "I'm awesome. I land on my feet."
  end

  # def eat
  #   "something else"
  # end

  # overwriting
  def eat(food, two)
    binding.pry # self
    super("fish") # call the eat method in the parent class
    puts "Play with #{food}."

  end

  def amammal_method
    binding.pry # self <= this is the cat instance that called this
    # method lookup chain
    # If it sees something it doesn't recognize
    # in your current block of code
    # Hey, let me look for it elsewhere.
    # 1. look for a local variable with that name
    # 2. look for a method in the same class with that name and run it
    # 3. hey, look at the parent and try to run its method with that name
    # 4. if it's not in your parent, keep going!
    # 5. if it gets to the end and finds nothing, error
    # self.nosuchmethod
    eat("fish", 'steak') # helper method
    return_value = super # it will just return and do nothing
    puts "What is going on?"
    5.times do
      super
    end
  end

  def giant_method
    # Pseudocode
    # write methods the do the ideal steps
    # first_thing
    # second_thing
    # third_thing
  end
end
