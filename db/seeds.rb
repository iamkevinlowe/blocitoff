require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

user = User.new(
  name:     'User',
  email:    'user@example.com',
  password: 'helloworld'
)
user.skip_confirmation!
user.save!
users = User.all

# Create Items
50.times do
  item = Item.create!(
    user:         users.sample,
    description:  Faker::Lorem.sentence
  )
end
items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"