require 'pry'
require_relative './team'
require_relative './player'
require_relative './user'
require_relative './tweet'
require_relative './color'
require_relative './team_color'
require_relative './like'

# name, colors, players
t1 = Team.new("Brooklyn Nets")
t2 = Team.new("Charlotte Hornets")
t3 = Team.new("Timberwolves")
t4 = Team.new("New York Knicks")

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

# Twitter!
u1 = User.new("Mike Cheng")
u2 = User.new("Joyce")
u3 = User.new("Matt")

tw1 = Tweet.new("Go Pokemon!", u1)
tw2 = Tweet.new("Pokemon Go!", u1)
tw3 = Tweet.new("Squirtle Squirtle!", u3)
tw4 = Tweet.new("Char char!", u3)
tw5 = Tweet.new("Oh my gosh!", u2)
tw6 = Tweet.new("#hashtag", u2)

l1 = Like.new(u1, tw4)
l2 = Like.new(u1, tw5)
l3 = Like.new(u2, tw1)
l4 = Like.new(u3, tw6)
l5 = Like.new(u3, tw5)

c1 = Color.new("Black")
c2 = Color.new("White")
c3 = Color.new("Turquoise")
c4 = Color.new("Purple")
c5 = Color.new("Blue")
c6 = Color.new("Yellow")
c7 = Color.new("Orange")

tc1 = TeamColor.new(t1, c1)
tc2 = TeamColor.new(t1, c2)
tc3 = TeamColor.new(t2, c3)
tc4 = TeamColor.new(t2, c4)
tc5 = TeamColor.new(t3, c5)
tc6 = TeamColor.new(t3, c6)
tc7 = TeamColor.new(t4, c5)
tc8 = TeamColor.new(t4, c7)

binding.pry

puts "bye bye!"
