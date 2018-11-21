class Dog < Pet
  include Mammal::InstanceMethods

  # attr_reader :name # defensive programming
  # attr_accessor :mood
  #
  # def initialize(name, mood = "nervous")
  #   @name = name
  #   @mood = mood
  # end

end
