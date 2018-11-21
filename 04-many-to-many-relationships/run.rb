require 'pry'
require_relative './tweet.rb'
require_relative './user.rb'
require_relative './squirrel'
require_relative './nest'
require_relative './tree'

# Yesterday's test data.
u1 = User.new("Mike")
t1 = Tweet.new("coffee", u1)
u1.post_tweet("cold brew")
u1.post_tweet("death before decaf!")
u1.post_tweet("happy coffee")

s1 = Squirrel.new("bushy")
s2 = Squirrel.new("not bushy")
s3 = Squirrel.new("bushy")

tr1 = Tree.new(5000, 1)

n1 = Nest.new(5, s1, Tree.new(20, 7))
n2 = Nest.new(0.1, s2, tr1)
n3 = Nest.new(15, s1, tr1)

binding.pry

puts "meow"
