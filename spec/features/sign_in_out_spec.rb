require 'rails_helper'
require 'faker'

describe "Sign in and out flow" do
  include TestFactories

  describe "top navaigation" do
    it "changes to indicate a user signed in and out" do
      user = authenticated_user
      visit root_path

      click_link 'Log In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      within 'form' do
        click_button 'Log in'
      end

      expect(page).to have_content(user.name)

      click_link 'log-out'

      expect(page).to have_content('Log In')
    end
  end

  describe "reset password" do
    it "changes user password" do
      user = authenticated_user
      visit root_path

      click_link 'Log In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      within 'form' do
        click_button 'Log in'
      end

      click_link 'edit'
      new_password = Faker::Lorem.characters(10)
      fill_in 'Password', with: new_password
      fill_in 'Password confirmation', with: new_password
      fill_in 'Current password', with: user.password

      click_button 'Update'
      expect(user.password).to eq(new_password)
    end
  end
end