require 'pry'

# Shortcuts! - Ask me if you want to learn them!

# puts "#1 Hello"
# binding.pry


# this gives me the game hash
 def game_hash
   # puts "#2 World"
   # binding.pry

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

 # Steps on how to do this.
 # use something like flatten to make it one?

 # 1st identify that there are two separate teams w/ same symbol
 # end goal would be to have array with ??????????????

 # create a holding place for all the players (empty array)
 # and then iterate through both teams and put in array?
   # use .each to iterate
   # on each iteration holding one team
   # while on that team, look for the key layer inside it
   # push those values into the new array


# # two people each has a shopping list
# home_players = game_hash[:home][:players]
# away_players = game_hash[:away][:players]
#
# # person 1 can give their shopping list to person 3
# # person 2 can give their shopping list to person 3
# all_players = home_players + away_players

# do it with concat
# all_players = []
# all_players.concat home_players
# all_players.concat away_players

# now person 3 has the full shopping list

# two different lists
# get each list
# put them into one big list

# puts "#3 ."
# binding.pry

                      # string
def num_points_scored(player_name)
  # if you were trying to explain this to someone in prework
  # who's stuck in hashketball, how would you explain how to do this?

  # find the num points scored as it relates to the name
  # we have all_players array
  # each value in all players has a smaller value that is the name of the player
  # that is also connected to the number of points they scored
  # find a way to sort the method / just find the value of points attributed to that name

  # hash of teams
  # visit each team
  # ask them for the player name list
  # check the list for the name
  # if i find it, then I have their points
  # I would return their points

  # argument pass in each player
  # try to return the amount of points associated with that player

  # pseudocode

  # i want all the players first <= simplify it ideally
  # home_players = game_hash[:home][:players]
  # away_players = game_hash[:away][:players]
  # all_players = home_players + away_players

  # so i can look through them
  # .each with an if
  # search, find, gofish
  # array of hashes
  # found_player = all_players.find do |player| # Hash
  #   # find the player that matches the name
  #   # binding.pry
  #   # if player[:player_name] == player_name
  #   #   true
  #   # else
  #   #   false
  #   # end
  #   player[:player_name] == player_name
  # end

  # get the points for that player
  found_player(player_name)[:points]
end

#$ abstraction, single Responsibility Principle => each method should do exactly one job
# should be readable
# to be able to test your code easily
def shoe_size(player_name)
  # i want all the players first <= simplify it ideally
  # so i can look through them
  # find the player that matches the name


  # found_player = all_players.find do |player| # Hash
  #   player[:player_name] == player_name
  # end

  # get the shoe size for that player
  found_player(player_name)[:shoe]
end

def all_players
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  home_players + away_players
  # game_hash[:home][:players] + game_hash[:away][:players]
end

def found_player(player_name)
  all_players.find do |player| # Hash
    player[:player_name] == player_name
  end
end

# Programming is creativity!
# You are HACKERS!

# From all_players, get the names (string) => ["Jeff Adrien", "Bismak Biyombo" ...]
player_names = all_players.map do |player|
  # the thing returned here is what ends up in the array
  player[:player_name]
end # collect
  # what steps to do each of these
  # what array method to use
    # because map returns same size of what your iterating over,
    # the thing in each place in the array is what you returned in the loop

    # returns the value for each item you iterate over

    # for when you have no condition, just want something back for all of them


# From all_players, get everyone with shoe size bigger than 10 => [{}, {}, ...]
  # GOOGLE!
  # it selects only specific data from the array
  # biggest it can be is a same size array
  # smallest is an empty array
big_shoe_players = all_players.select do |player|
  player[:shoe] > 10
end

binding.pry
