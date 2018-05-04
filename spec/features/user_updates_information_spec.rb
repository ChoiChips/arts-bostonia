require 'rails_helper'

feature 'user updates information', %Q{
  As an authenticated user
  I want to update my information
  So that I can keep my profile up to date
} do
  scenario 'successfully edits user information' do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Profile')

    click_link 'Profile'

    expect(page).to have_content('Edit User')

    fill_in 'Email', with: "test_email@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    fill_in 'Current password', with: "password"

    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully')
    expect(page).to have_content('My Activity')
    expect(page).to have_content('Profile')
    expect(page).to have_content('Sign Out')
  end

  scenario 'unsuccessfully edit user information' do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Profile')

    click_link 'Profile'

    expect(page).to have_content('Edit User')

    fill_in 'Email', with: "test_email@gmail.com"
    fill_in 'Password', with: "password1"
    fill_in 'Password confirmation', with: "password2"
    fill_in 'Current password', with: "password3"

    click_button 'Update'

    expect(page).to have_content('Edit User')
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to have_content("Current password is invalid")
    expect(page).to have_content('2 errors prohibited this user from being saved')
  end
end
