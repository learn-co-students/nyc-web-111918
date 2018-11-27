module AModuleName # Namespace
  module ClassMethods
    @@all = []

    def all
      @@all
    end
  end

  module InstanceMethods
    def walk
      super
      puts "I can walk."
    end
  end
end
