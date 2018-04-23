require 'rails_helper'

feature "user can add spot" do
  scenario "user add new spot successfully" do

    visit new_spot_path
    expect(page).to have_content "Add new spot"

    fill_in "Name", with "Cool Spot 1"
    fill_in "Location", with "77 Summer St, Boston, MA, 02111"
    fill_in "Description", with "This is a really cool spot to visit"

    click_button "Add Spot"

    expect(page).to have_content "Added New Spot Successfully"
    expect(page).to have_content "Cool Spot 1"
    expect(page).to have_content "77 Summer St, Boston, MA, 02111"
    expect(page).to have_content "This is a really cool spot to visit"
  end

  scenario "visitor does not provide proper information for a spot" do
    visit new_spot_path

    click_button "Add Spot"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Location can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end
