require 'rails_helper'

describe "User profile" do
  include TestFactories

  before do
    @user = authenticated_user
    visit root_path

    click_link 'Log In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    within 'form' do
      click_button 'Log in'
    end
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