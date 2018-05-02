require 'rails_helper'

feature 'admin deletes user' do
  before(:each) do
    @user = User.create!(role: 'user', email: 'testo@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', admin: false)
    @admin = User.create!(role: 'admin', email: 'admin@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', admin: true)


    visit new_user_session_path
    fill_in 'Email', with: @admin.email
    fill_in 'Password', with: @admin.password
    click_button 'Log in'
  end

  scenario 'delete a non-admin user' do
    visit users_path
    expect(page).to have_content('testo@gmail.com')
    find(".user-#{@user.id}").click
    visit users_path
    expect(page).not_to have_content("testo@gmail.com")
  end

  scenario 'admin user cannot delete itself' do
    visit users_path
    expect(page).to have_content("admin@gmail.com")
    find(".user-#{@admin.id}").click
    expect(page).to have_content("admin@gmail.com")
    expect(page).to have_content("Admins can't delete own account")
  end
end
