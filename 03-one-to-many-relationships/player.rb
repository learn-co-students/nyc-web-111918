class Player
  attr_accessor :number, :shoe_size, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks, :team
  attr_reader :player_name

  @@all = [] # Array of Player instances

                 # String     Number  Number Number Number    Number   Number  Number  Number
  def initialize(player_name, number, shoe, points, rebounds, assists, steals, blocks, slam_dunks, team)
    @player_name = player_name
    @number = number
    @shoe_size = shoe
    @points = points
    @rebounds = rebounds
    @assists = assists
    @steals = steals
    @blocks = blocks
    @slam_dunks = slam_dunks
    @team = team

    @@all << self
  end

  def slam_dunk
    @slam_dunks += 1
    self.score_two
    puts "OOOOOHHHHHH!!!"
  end

  def layup
    self.score_two
    puts "AHHHHHHHHHH!!!"
  end

  def score_two
    # @points += 2
    self.points += 2
  end

  # Whacky inefficient!!!
  # def team
  #   Team.all.find do |team|
  #     team.players.find do |player|
  #       player == self
  #     end
  #   end
  # end

  # Cleaner code but still crazy inefficient!
  # def team
  #   Team.all.find do |team|
  #     team.players.include? self
  #   end
  # end

  # This was my all_players method
  def self.all
    @@all
  end

  # Arguments:
  #   player_name => String
  # Return => Player instance
  def self.find_player(player_name)
    # self.all in here is the same as Player.all
    self.all.find do |player| # Player instance
      # String (via getter) # String
      player.player_name == player_name # Boolean
    end
  end

  # Arguments:
  #   player_name => String
  # Return => Number
  def self.num_points_scored(player_name)
    # Player instance  # String   # getter method
    self.find_player(player_name).points # Number
  end

  # Arguments:
  #   player_name => String
  # Return => Number
  def self.shoe_size(player_name)
    # Player instance  # String   # getter method
    self.find_player(player_name).shoe_size # Number
  end

  # Return => Array of Strings
  def self.player_names
    self.all.map do |player| # Player instance
      player.player_name # String
    end
  end

  # Return => Array of Player instances
  def self.big_shoe_players
    self.all.select do |player| # Player instance
      # Number           # Number
      player.shoe_size > 10 # Boolean
    end
  end
end # end of Player class
