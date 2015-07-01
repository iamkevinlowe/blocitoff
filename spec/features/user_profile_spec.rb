require 'rails_helper'

describe "User profile" do
  include TestFactories

  before do
    @user = authenticated_user
    sign_in(@user)
  end

  describe "after signing in" do
    it "redirects to the user's show page" do
      expect(current_path).to eq("/users/#{@user.id}")
    end

    it "shows the appropriate user details" do
      expect(page).to have_content("#{@user.name}'s To-Dos")
    end
  end
end