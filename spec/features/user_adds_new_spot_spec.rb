require 'rails_helper'

feature 'authenticated user adds new spot' do
  before(:each) do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end
  scenario 'fill out add new spot form' do

    visit new_spot_path

    expect(page).to have_content('Add New Art Spot')
    fill_in "Name", with: "Cool new art spot"
    fill_in "Description", with: "Lorem ipsum dolum sit amet"
    fill_in "Location", with: "Boston, MA"

    click_button "Add Spot"

    expect(page).to have_content("Spot added successfully")

  end
end
