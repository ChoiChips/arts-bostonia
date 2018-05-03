require 'rails_helper'

feature 'admin deletes spot' do
  before(:each) do
    @user = User.create!(role: 'user', email: 'testo@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', admin: false)
    @admin = User.create!(role: 'admin', email: 'admin@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', admin: true)
    @spot = Spot.create!(name: 'Some beautiful spot',location:'Boston, MA',description:'Lorem ipsum dolum sit amet',user:@user)

    visit new_user_session_path
    fill_in 'Email', with: @admin.email
    fill_in 'Password', with: @admin.password
    click_button 'Log in'
  end

  scenario 'delete a spot' do
    visit users_path
    expect(page).to have_content('Some beautiful spot')
    find(".spot-#{@spot.id}").click
    visit users_path
    expect(page).not_to have_content("Some beautiful spot")
  end

end
