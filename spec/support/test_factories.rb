module TestFactories
  require 'faker'

  def authenticated_user(options={})
    user_options = {
      name: 'Test',
      email: "test#{rand}@example.com",
      password: 'helloworld'
    }.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save!
    user
  end

  def associated_item(options={})
    item_options = {
      description: Faker::Lorem.sentence,
      completed?: false,
      user: authenticated_user
    }.merge(options)
    Item.create(item_options)
  end
end