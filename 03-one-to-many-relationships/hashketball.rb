require 'pry'

######################
##### Basic Ruby #####
######################

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Return => Array of player Hashes
def all_players
  home_players = game_hash[:home][:players] # Array of player Hashes
  away_players = game_hash[:away][:players] # Array of player Hashes
  home_players + away_players # Array of player Hashes
end

# Arguments:
#   player_name => String
# Return => Number
def num_points_scored(player_name)
  # Hash       # String     #Symbol
  found_player(player_name)[:points] # Number
end

# Arguments:
#   player_name => String
# Return => Number
def shoe_size(player_name)
  # Hash       # String     #Symbol
  found_player(player_name)[:shoe] # Number
end

# Arguments:
#   player_name => String
# Return => a player Hashes
def found_player(player_name)
  binding.pry
  # Array of player Hashes
  all_players.find do |player| # player Hash
    # String                # String
    player[:player_name] == player_name # Boolean
  end
end

# Array of Strings    # Array of player Hashes
player_names        = all_players.map do |player| # player Hash
  player[:player_name] # String
end

# Array of player Hashes    # Array of player Hashes
big_shoe_players          = all_players.select do |player| # player Hash
  # Number        # Number
  player[:shoe] > 10 # Boolean
end



#######################################
##### OBJECT ORIENTED PROGRAMMING #####
#######################################

class Player
  attr_accessor :number, :shoe_size, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks
  attr_reader :player_name

  @@all = [] # Array of Player instances

                 # String     Number  Number Number Number    Number   Number  Number  Number
  def initialize(player_name, number, shoe, points, rebounds, assists, steals, blocks, slam_dunks)
    @player_name = player_name
    @number = number
    @shoe_size = shoe
    @points = points
    @rebounds = rebounds
    @assists = assists
    @steals = steals
    @blocks = blocks
    @slam_dunks = slam_dunks

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

# Making instances of a Player
p1 = Player.new("Alan Anderson", 0, 16, 22, 12, 12, 3, 1, 1)
p2 = Player.new("Reggie Evans", 30, 14, 12, 12, 12, 12, 12, 7)
p3 = Player.new("Brook Lopez", 11, 17, 17, 19, 10, 3, 1, 15)
p4 = Player.new("Mason Plumlee", 1, 19, 26, 12, 6, 3, 8, 5)
p5 = Player.new("Jason Terry", 31, 15, 19, 2, 2, 4, 11, 1)
p6 = Player.new("Jeff Adrien", 4, 18, 10, 1, 1, 2, 7, 2)
p7 = Player.new("Bismak Biyombo", 0, 16, 12, 4, 7, 7, 15, 10)
p8 = Player.new("DeSagna Diop", 2, 14, 24, 12, 12, 4, 5, 5)
p9 = Player.new("Ben Gordon", 8, 15, 33, 3, 2, 1, 1, 0)
p10 = Player.new("Brendan Haywood", 33, 15, 6, 12, 12, 22, 5, 12)
p11 = Player.new("Air Bud", 9000, 9001, 9002, 9003, 9004, 9005, 9006, 9007)


class Cat
  attr_reader :fur_color, :name
  attr_accessor :anger_level

  @@all = [] # Array of Cat instances

                # String    String  Number
  def initialize(fur_color, name, anger_level)
    @fur_color = fur_color
    @name = name
    @anger_level = anger_level
  end

  def meow
    puts "Meeeeoow! I'm #{self.name}."
  end

  # Angry cats are willing to fight.
  def self.cat_army
    self.all.select do |cat|
      cat.anger_level > 7
    end
  end
end # end of Cat class

c1 = Cat.new("tiger striped", "Gwen", 10)
c2 = Cat.new("brown", "Cinnamon", 9001)
c3 = Cat.new("black and white", "Sugar", 1)

binding.pry

puts "bye bye!"
