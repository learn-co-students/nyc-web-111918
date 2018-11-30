100.times do
  User.create(name: Faker::Cat.name, email: Faker::Internet.email, age: (0..100).to_a.sample)
end
puts "done seeding user"
