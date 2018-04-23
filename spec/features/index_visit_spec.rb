require 'rails helper'

feature 'index visit' do
  scenario "visitor sees spots displayed on index page" do
    user = User.create(name: "John Doe", status: "user", email: "example@gmail.com", photo: "x", display_name: "John")
    spot = Spot.create(name: "George Washington statue", location: "Cambridge Commons, Cambridge, MA", photo: "https://upload.wikimedia.org/wikipedia/commons/3/33/George_Washington_statue_in_the_Boston_Public_Garden_-_DSC08199.JPG", description: "He's sitting on a horse", artist: "unknown", user_id: 1)

    visit index

    expect(page).to have_content('George Washington statue')
    expect(page).to have_content('Cambridge')
  end
end
