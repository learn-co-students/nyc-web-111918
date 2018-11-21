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

# EVERYTHING IS AN OBJECT IN RUBY!
#   What is an object?
#     an object is a thing that
#     responds to message to do work (methods)
#   Objects have methods. They respond to messages to do work.
#   They cannot respond to messages (methods) that they don't
#   understand! NoMethodError!!

#   So...
#     Numbers do numbery things.
#     Arrays do array things.
#     Hashes do hashy things.
#     The things inside Arrays and Hashes are other objects.
#     Those objects have their own type that tells you what
#     they can do!

# Ruby
# - Syntactic Sugar => makes some syntax much nicer


# THE PROBLEM!
#   Consider these two Hashes. What do they represent?
alan_anderson = { player_name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1 }
gwen = { fur_color: "tiger striped", name: "Gwen", anger_level: 10 }
#   These Hashes have different data.
#   They represent different objects.
#   A Hash of a player should be different from a Hash of a cat.
#   Logically, they should also have different methods
#   specific to them.
#   JUST LIKE how a Hash has different methods than a Fixnum.

# THE SOLUTION!
#   Create a custom class to represent a new type of object.
#   This class can now be used, just like the String class,
#   to make new instances of that type of object!
class Player # this has to be capitalized
  # Macros => Writes the getter and setter methods for us.

  # getter + setter methods in one macro
  attr_accessor :number, :shoe_size, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks

  # writes our getter methods
  attr_reader :player_name #, :number, :shoe_size, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks
  # instance method => getter
  # def player_name
  #   @player_name
  # end

  # writes our setter methods
  # attr_writer :number, :shoe_size, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks
  # instance method => setter
  # def player_name=(player_name)
  #   @player_name = player_name
  # end

  # Class Variables belong to the class they are defined in.
  # A place to store information pertinant to the entire
  # Player class.
  @@all = [] # Array of Player instances
  ALL = [] # this cannot change it's data type
  all = []

  # This is the method called when we do Player.new
  # It creates a new _instance_ of a Player
  #   an instance => a moment
                 # String     Number  Number Number Number    Number   Number  Number  Number
  def initialize(player_name, number, shoe, points, rebounds, assists, steals, blocks, slam_dunks)
    # @instance_variable <= @ sign in front is an instance variable
    # instance variables, stay with the instance!
    @player_name = player_name
    @number = number
    @shoe_size = shoe # we don't have to match up the arg name with the instance variable name
    @points = points
    @rebounds = rebounds
    @assists = assists
    @steals = steals
    @blocks = blocks
    @slam_dunks = slam_dunks

    steal = steals # local variable, disappears!

    @@all << self # self in the initialize method is the instance being made
  end

  # You write instance methods so your custom object, Player,
  # can do work specific to that type of object.
  # Hashes do Hashy things. Players to Playery things.
  # Example: A Player _instance_ can slam_dunk a basketball.
  def slam_dunk
    @slam_dunks += 1
    self.score_two

    self # <= what is this?
    # self can be called anywhere
    # it will tell you who called the method you are in
    # So ask yourself, who called me? => That's self!
    #   self in an instance method is the instance that called it
    # Because we have access to self, the instance,
    # logically it makes sense that we can use other
    # instance methods in here!

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

  ## PROBLEM SOLVED!
  # => We can now differentiate between different
  #    types of objects with their own unique attributes
  #    and their own unique methods!

  ################################
  ## NEW PROBLEM... (see below) ##
  ################################

  ## THE SOLUTION!

  # This is a Class method. Methods for the entire Class!
  # Called with Player.all
  def self.all
    @@all # in this class method, we are writing
          # a getter to retrieve the @@all class variable
  end

  ## QUESTION!
  #   Those Hashketball methods, where do they belong?
  # => Outside the class?
  # => Inside the class as instance methods?
  # => Inside the class as class methods?
  #
  #   Think about what work the method is meant to do.
  #   Think about whose responsibility it is to do those methods.
  #   Who should you ask to run those methods?
  # => ANSWER: The class!

  # Arguments:
  #   player_name => String
  # Return => Player instance
  def self.find_player(player_name)
    self # <= what is this?
    # The class called it, so it should be Player!
    # What might be useful for Player?

    # class variables can be accessed
    # in both class and instance methods
    # So if we want all of the Players,
    # we can get it via @@all since we are inside of Player!
    @@all.find do |player| # Player instance
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
    # self.all in here is the same as Player.all
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
# => No longer a Hash!
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

## NEW PROBLEM!
#   We have all those nifty methods for searching for
#   specific player stats/information.
#   While we can just ask these player instances directly,
p1.points # num_points_scored
p1.shoe_size # shoe_size
# We'd have to know who to ask first.
# In Hashketball, we had methods to help us locate a player
# and then ask them for their data.
# => all_players
# => found_player
# But those required a collection (directory, yellow pages)
# of the players to work.
## BAD SOLUTION
#   We could store all the player instances in a global array
#   as we make them.
#   Then use that global array as our all_players:
$all_players = []
$all_players << p1
$all_players << p2
# etc...
# But if we imagine our app growing huge for all 300+ players,
# this becomes a pain. Also, GLOBAL VARIABLES ARE BAD!

## THE SOLUTION!
#   Wouldn't it be nice if we could ask the Player class
#   and have us tell it information about all Player things
#   (objects, instances)?
#   Just like how we can ask an individual player [instance]
#   for information about just that player?
# => ENTER CLASS VARIABLE && CLASS METHODS!

# We can even make a Cat class now for cat objects!
class Cat
  attr_reader :fur_color, :name
  attr_accessor :anger_level

  @@all = [] # Array of Cat instances

                # String    String  Number
  def initialize(fur_color, name, anger_level)
    @fur_color = fur_color
    @name = name
    @anger_level = anger_level

    @@all << self # storing a reference to the cat instance
  end

  def meow
    puts "Meeeeoow! I'm #{self.name}."
  end

  # Angry cats are willing to fight.
  def self.cat_army
    @@all.select do |cat|
      cat.anger_level > 7
    end
  end

  def self.all
    @@all
  end
end # end of Cat class

c1 = Cat.new("tiger striped", "Gwen", 10)
c2 = Cat.new("brown", "Cinnamon", 9001)
c3 = Cat.new("black and white", "Sugar", 1)

binding.pry

puts "bye bye!"
