# where you combine all your code

require 'pry'
require_relative './cat'
require_relative './team'
require_relative './user'
require_relative './tweet'

# t1.players

require_relative './player'

# UH OH>?>?!?>!>?
# 1. we can't make a player before a team
#    and we can't make a team before a player
# 2. trading? we need to make sure both sides
#    are away of the change
#    => single source of truth
# Teams => all the team stuff
# Players => about the player stuff
# Everything else that can be calculated, should be calculated.

# Making instances of a Player
# p1 = Player.new("Alan Anderson", 0, 16, 22, 12, 12, 3, 1, 1) # , t1)
# p2 = Player.new("Reggie Evans", 30, 14, 12, 12, 12, 12, 12, 7) # , t1)
# p3 = Player.new("Brook Lopez", 11, 17, 17, 19, 10, 3, 1, 15) # , t1)
# p4 = Player.new("Mason Plumlee", 1, 19, 26, 12, 6, 3, 8, 5) # , t1)
# p5 = Player.new("Jason Terry", 31, 15, 19, 2, 2, 4, 11, 1) # , t1)
# p6 = Player.new("Jeff Adrien", 4, 18, 10, 1, 1, 2, 7, 2) # , t2)
# p7 = Player.new("Bismak Biyombo", 0, 16, 12, 4, 7, 7, 15, 10) # , t2)
# p8 = Player.new("DeSagna Diop", 2, 14, 24, 12, 12, 4, 5, 5) # , t2)
# p9 = Player.new("Ben Gordon", 8, 15, 33, 3, 2, 1, 1, 0) # , t2)
# p10 = Player.new("Brendan Haywood", 33, 15, 6, 12, 12, 22, 5, 12) # , t2)
# p11 = Player.new("Air Bud", "k9", 9001, 9002, 9003, 9004, 9005, 9006, 9007) # , t3)
#

# name, colors, players
t1 = Team.new("Brooklyn Nets", ["Black", "White"]) #, Player.all[0..4])
t2 = Team.new("Charlotte Hornets", ["Turquoise", "Purple"]) # , Player.all[5..9])
t3 = Team.new("Timberwolves", ["Blue", "Yellow"]) # , Player.all[5..9])

# Making instances of a Player
p1 = Player.new("Alan Anderson", 0, 16, 22, 12, 12, 3, 1, 1, t1)
p2 = Player.new("Reggie Evans", 30, 14, 12, 12, 12, 12, 12, 7, t1)
p3 = Player.new("Brook Lopez", 11, 17, 17, 19, 10, 3, 1, 15, t1)
p4 = Player.new("Mason Plumlee", 1, 19, 26, 12, 6, 3, 8, 5, t1)
p5 = Player.new("Jason Terry", 31, 15, 19, 2, 2, 4, 11, 1, t1)
p6 = Player.new("Jeff Adrien", 4, 18, 10, 1, 1, 2, 7, 2, t2)
p7 = Player.new("Bismak Biyombo", 0, 16, 12, 4, 7, 7, 15, 10, t2)
p8 = Player.new("DeSagna Diop", 2, 14, 24, 12, 12, 4, 5, 5, t2)
p9 = Player.new("Ben Gordon", 8, 15, 33, 3, 2, 1, 1, 0, t2)
p10 = Player.new("Brendan Haywood", 33, 15, 6, 12, 12, 22, 5, 12, t2)
p11 = Player.new("Air Bud", "k9", 9001, 9002, 9003, 9004, 9005, 9006, 9007, t3)

c1 = Cat.new("tiger striped", "Gwen", 10)
c2 = Cat.new("brown", "Cinnamon", 9001)
c3 = Cat.new("black and white", "Sugar", 1)

u1 = User.new("Mike Cheng")
u2 = User.new("Joyce")
u3 = User.new("Matt")

tw1 = Tweet.new("Go Pokemon!", u1)
tw2 = Tweet.new("Pokemon Go!", u1)
tw3 = Tweet.new("Squirtle Squirtle!", u3)
tw4 = Tweet.new("Char char!", u3)
tw5 = Tweet.new("Oh my gosh!", u2)
tw6 = Tweet.new("#hashtag", u2)


binding.pry

puts "bye bye!"
