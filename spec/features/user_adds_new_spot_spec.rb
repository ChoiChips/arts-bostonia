require 'rails_helper'


# As an authenticated user
# I want to create a new installation "spot"
# So that I can share interesting art that I found

# Acceptance Criteria
# [] I should see an “Add Art Spot” link in the top bar, visible from every page.’
# [] I should see an “Add New Art Spot” callout link in the body of the page.
# [] I should add a new art spot and save it to the database.

feature 'authenticated user adds new spot' do
  before(:each) do
    user = FactoryBot.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end
  # scenario 'clicks add new spot link in nav' do
  # end
  # scenario 'clicks add new spot link in page body' do
  # end
  scenario 'fill out add new spot form' do

    visit new_spot_path

    expect(page).to have_content('Add New Art Spot')

    # fill_in 'Name', with: "Cool new art spot"
    # fill_in 'Description', with: "Lorem ipsum dolum sita met."
    # fill_in 'Location', with: "Boston, MA"

    # click_button 'Add Spot'

    # visit spot_path

    # expect(page).to have_content('Cool new art spot')
    # expect(page).to have_content('Lorem ipsum dolum sita met.')
    # expect(page).to have_content('Boston, MA')
  end
end
