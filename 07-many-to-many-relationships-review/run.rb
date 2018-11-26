require 'pry'
require_relative './team'
require_relative './player'
require_relative './user'
require_relative './tweet'
require_relative './book'
require_relative './author'
require_relative './squirrel'
require_relative './nest'
require_relative './tree'


# Squirrels, Trees
# <= Becase the Nest needs to know what it belongs_to

# color, squishiness, anger_level
s1 = Squirrel.new("red", "very", 10)
s2 = Squirrel.new("black", "moderately", 2)
s3 = Squirrel.new("white", "extremely like a cloud", 0)

# branches, leaves, tallness (miles)
tr1 = Tree.new(300, 300, 300)
tr2 = Tree.new(1, 100, 1)
tr3 = Tree.new(5, 0, 70000)

# tree, squirrel, size, material(s) <= refactor into an array
n1 = Nest.new(tr1, s1, tr1.tallness, "squishy")
n2 = Nest.new(tr2, s1, 11, "squirrel?")
n3 = Nest.new(tr1, s2, 1, "structurally sound")



# name, age
a1 = Author.new("Mike", 33)
a2 = Author.new("Stephen King", 71)

# title, edition = 1, published_date
b1 = Book.new(a1, "The Joys of Ruby", 2011)
b2 = Book.new(a2, "The Misery", 1987)
b3 = Book.new(a2, "Pet Cemetary", 1983)













# name, colors, players
t1 = Team.new("Brooklyn Nets", ["Black", "White"])
t2 = Team.new("Charlotte Hornets", ["Turquoise", "Purple"])
t3 = Team.new("Timberwolves", ["Blue", "Yellow"])

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


binding.pry

puts "bye bye!"
