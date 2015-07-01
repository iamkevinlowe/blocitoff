require 'rails_helper'
require 'faker'

describe ItemsController do
  include TestFactories

  before do
    @user = authenticated_user
    sign_in(@user)

    @task1 = Faker::Lorem.sentence
    @task2 = Faker::Lorem.sentence
    @task3 = Faker::Lorem.sentence
    fill_in 'Enter new task', with: @task1
    click_button 'Save'
    fill_in 'Enter new task', with: @task2
    click_button 'Save'
    fill_in 'Enter new task', with: @task3
    click_button 'Save'
  end

  describe "item creation" do
    it "creates multiple items" do
      expect(page).to have_content('New task created.')
    end

    it "displays items after creation" do
      expect(page).to have_content(@task1)
      expect(page).to have_content(@task2)
      expect(page).to have_content(@task3)
    end
  end
end