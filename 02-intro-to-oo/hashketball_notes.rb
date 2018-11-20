require 'pry'

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



#################################
##### TODAY'S LECTURE CODE! #####
#################################

# EVERYTHING IS AN OBJECT IN RUBY!
#   an object has a pre-defined description of what it is or what it does
#   an object is prototype of a type of thing
#   an object is a thing that can be defined and manipulated
#   an object is a stored method that has a specific function

# Objects have methods. They respond to messages to do work.
# They cannot respond to messages (methods) that they don't
# understand!

# Ruby
# - Syntactic Sugar => makes some syntax much nicer


# THE PROBLEM!
#   These Hashes have different data.
#   They represent different objects.
#   A Hash of a player should be different from a Hash of a cat.
#   Logically, they should also have different methods
#   specific to them.
#   JUST LIKE how a Hash as different methods than a Fixnum

alan_anderson = {
  player_name: "Alan Anderson",
  number: 0,
  shoe: 16,
  points: 22,
  rebounds: 12,
  assists: 12,
  steals: 3,
  blocks: 1,
  slam_dunks: 1
}

reggie_evans = {
  player_name: "Reggie Evans",
  number: 30,
  shoe: 14,
  points: 12,
  rebounds: 12,
  assists: 12,
  steals: 12,
  blocks: 12,
  slam_dunks: 7
}

c1 = { fur_color: "tiger striped", name: "Gwen", anger_level: 10 }

# THE SOLUTION!
#   create a custom class / object to represent a new object
#   (object being a thing)
class Player # this has to be capitalized
  # Macros => Writes the getter and setter methods for us.
  # getter + setter methods
  attr_accessor :number, :shoe_size, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks

  # getter method
  attr_reader :player_name #, :number, :shoe_size, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks
  # instance method => getter
  # def player_name
  #   @player_name
  # end

  # setter method
  # attr_writer :number, :shoe_size, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks
  # instance method => setter
  # def player_name=(player_name)
  #   @player_name = player_name
  # end

  # an instance => a moment
  # @instance_variable <= @ sign in front is an instance variable

  # This is the method called when we do .new
  # It creates a new _instance_ of a Player
  def initialize(player_name, number, shoe, points, rebounds, assists, steals, blocks, slam_dunks)
    @player_name = player_name
    @number = number
    @shoe_size = shoe
    @points = points
    @rebounds = rebounds
    @assists = assists
    @steals = steals
    @blocks = blocks
    @slam_dunks = slam_dunks # instance variables, stay with the instance!
    steal = steals # local variable, disappears!
  end

  # You write instance methods so your custom object, Player,
  # can do work specific to that type of object.
  # Hashes do Hashy things. Players to Playery things.
  # Example: A Player _instance_ can slam_dunk a basketball.
  def slam_dunk
    # When you dunk, your @slam_dunks go up AND @points go up.
    @slam_dunks += 1
    # @points += 2
    # Alternatively, you can do this!
    self.score_two # WHAAAAT??

    self # <= what is this?
    # self can be called anywhere
    # it will tell you who called the method you are in
    # So ask yourself, who called me? => That's self!

    # self in an instance method is the instance that called it
    # So self.score_two is calling the score_two instance method.
    # binding.pry
    # self.slam_dunk
    puts "OOOOOHHHHHH!!!"
  end

  def layup
    self.score_two
    puts "AHHHHHHHHHH!!!"
  end

  def score_two
    # @points += 2
    # can also be (because we have a setter method):
    self.points += 2 # self.points = self.points + 2
  end

  # Left off here.
  # This is a Class method. Methods for the entire Class!
  # Called with Player.example
  def self.example
    self # <= what is this?
    # The class called it, so it should be Player!
    # What might be useful for Player?
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





binding.pry

puts "bye bye!"
