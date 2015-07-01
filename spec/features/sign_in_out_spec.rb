require 'rails_helper'
require 'faker'

describe "Sign in and out flow" do
  include TestFactories

  before do
    @user = authenticated_user
    sign_in(@user)
  end    

  describe "top navaigation" do
    it "changes to indicate a user signed in" do
      expect(page).to have_content(@user.name)
    end

    it "changes to indicate a user signed out" do
      click_link 'log-out'
      expect(page).to have_content('Log In')
    end
  end

  describe "reset password" do
    it "changes user password" do
      click_link 'edit'
      new_password = Faker::Lorem.characters(10)
      fill_in 'Password', with: new_password
      fill_in 'Password confirmation', with: new_password
      fill_in 'Current password', with: @user.password
      click_button 'Update'
      click_link 'log-out'
      click_link 'Log In'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: new_password
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
  end
end