require 'rails_helper'

describe User do
  describe "User Sign Up" do

    before do
      @user = User.new(
        name: 'Test',
        email: 'test@example.com',
        password: 'helloworld'
        )
      @user.skip_confirmation!
      @user.save!
    end

    describe "sign up with an invalid email" do
      it "does not create new user" do
        user_count = User.count
        User.create(
          name: 'new_test',
          email: 'new_test@example',
          password: 'helloworld'
          )
        User.create(
          name: 'another_test',
          email: 'example.com',
          password: 'helloworld'
          )
        expect(User.count).to eq(user_count)
      end
    end

    describe "sign up with a duplicate email" do
      it "does not create new user" do
        user_count = User.count
        User.create(
          name: 'new_test',
          email: 'test@example.com',
          password: 'helloworld'
          )
        expect(User.count).to eq(user_count)
      end
    end
  end
end