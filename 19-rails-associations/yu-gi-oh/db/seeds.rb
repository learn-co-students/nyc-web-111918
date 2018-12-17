# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create_table "decks", force: :cascade do |t|
#   t.integer "cards"
#   t.string "deck_type"
#   t.integer "player_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "players", force: :cascade do |t|
#   t.string "name"
#   t.string "hair_color"
#   t.string "blood_type"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

# hmm how can I "empty" the database?

# Let's play YuGiOh!!!!
# first because no foreign keys
puts "destroy them all!!!"
Player.destroy_all # Facebook doesn't do this!
puts "Creating Players"
Player.create(name: "Isaac", hair_color: "blue", blood_type: "O")
Player.create(name: "Matt", hair_color: "totally magenta", blood_type: "-O")
Player.create(name: "Oh Man I'm Sorry", hair_color: "rainbow", blood_type: nil)
Player.create(name: "John", hair_color: nil, blood_type: "+A")
puts "Enlisted"

# came second because of foreign key dependency
puts "Sell decks."
Deck.destroy_all
puts "Building Decks"
Deck.create(cards: 42, deck_type: "Dragon", player_id: Player.all.sample.id)
Deck.create(cards: 50, deck_type: "Fairy", player_id: Player.all.sample.id)
Deck.create(cards: 60, deck_type: "Mecha", player_id: Player.all.sample.id)
Deck.create(cards: 100, deck_type: "Bug", player_id: Player.all.sample.id)
Deck.create(cards: 1, deck_type: "Magician", player_id: Player.all.sample.id)
Deck.create(cards: 10, deck_type: "Star Wars", player_id: Player.all.sample.id)
Deck.create(cards: 20, deck_type: "Harry Potter", player_id: Player.all.sample.id)
Deck.create(cards: 80, deck_type: "Toon", player_id: Player.all.sample.id)
puts "All done!"
