# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


      # t.string :name
      # t.integer :health
      # t.integer :damage
      # t.integer :armor
      # t.string :class
      # t.string :color
      # t.string :catchphrase
      # t.string :avatar_url




# def generate_phrase
#   phrase = []
#   (30..50).to_a.sample.times do
#     phrase << ["0", "1"].sample
#   end

#   phrase.join("")
# end


# def generate_name
#   alphabet = ('A'..'z').to_a
#   digits = ('0'..'9').to_a

#   bot_name = ""

#   [1,2,3].sample.times do 
#     bot_name = bot_name + alphabet.sample
#   end

#   bot_name = bot_name + '-' + digits.sample + digits.sample
#   bot_name
# end

# def generate_stats 
#   bot_classes = ["Assault", "Defender", "Support"]
#   high_range = (80..100).to_a
#   medium_range = (40..80).to_a
#   low_range = (20..40).to_a

#   selected_class = bot_classes.sample

#   stats = {}

#   case selected_class 
#     when "Assault"
#       stats[:health] = medium_range.sample
#       stats[:damage] = high_range.sample
#       stats[:armor] = low_range.sample
#     when "Defender"
#       stats[:health] = medium_range.sample
#       stats[:damage] = low_range.sample
#       stats[:armor] = high_range.sample
#     when "Support"
#       stats[:health] = high_range.sample
#       stats[:damage] = low_range.sample
#       stats[:armor] = medium_range.sample
#   end

#   {stats: stats, bot_class: selected_class}

# end

# 100.times do 

#   info = generate_stats

#   Bot.create({
#     name: generate_name,
#     health: info[:stats][:health],
#     damage:info[:stats][:damage],
#     armor: info[:stats][:armor],
#     bot_class: info[:bot_class],
#     catchphrase: generate_phrase,
#     avatar_url: Faker::Avatar.image("robo-warrior")
#     })
# end

Resetter.reset