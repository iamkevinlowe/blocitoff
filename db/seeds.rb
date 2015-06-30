require 'faker'

# Create User
user = User.new(
  name:     'User',
  email:    'user@example.com',
  password: 'helloworld'
  )
user.skip_confirmation!
user.save!