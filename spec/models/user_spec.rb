require 'rails_helper'

describe User do

  include TestFactories

  describe "sign up" do

    describe "with an invalid email" do
      it "does not create new user" do
        user_count = User.count
        begin
          authenticated_user(options={email: 'test@example'})
          authenticated_user(options={email: 'example.com'})
        rescue
        end
        expect(User.count).to eq(user_count)
      end
    end

    describe "with a duplicate email" do
      it "does not create new user" do
        test_email = "test#{rand}@example.com"
        begin
          authenticated_user(options={email: test_email})
          user_count = User.count
          authenticated_user(options={email: test_email})
        rescue
        end
        expect(User.count).to eq(user_count)
      end
    end
  end
end