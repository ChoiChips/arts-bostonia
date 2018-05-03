require 'rails_helper'

feature 'admin deletes review' do
  before(:each) do
    @user = User.create!(role: 'user', email: 'testo@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', admin: false)
    @admin = User.create!(role: 'admin', email: 'admin@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', admin: true)
    @spot = Spot.create!(name: 'Some beautiful spot',location:'Boston, MA',description:'Lorem ipsum dolum sit amet',user:@user)
    @review = Review.create!(description: 'stupid ugly birds', rating: 1, user:@user, spot:@spot)

    visit new_user_session_path
    fill_in 'Email', with: @admin.email
    fill_in 'Password', with: @admin.password
    click_button 'Log in'
  end

  scenario 'delete a review' do
    visit users_path
    expect(page).to have_content('stupid ugly birds')
    find(".spot-#{@review.id}").click
    visit users_path
    expect(page).not_to have_content("stupid ugly birds")
  end

end
