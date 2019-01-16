class Robot
  attr_reader :name, :weight, :specialty

  def initialize(name, weight, specialty)
    @name = name
    @weight = weight
    @specialty = specialty
  end

  def recharge_batteries
    puts "#{self.name} is recharging its batteries"
  end

  def self.class_method
    puts 'so easy.. '
  end

  private

  def strong_params
    puts ' secret 🤔 🤫'
  end

end

Robot.class_method

robot1 = Robot.new('n', '1','ok')
robot1.recharge_batteries
