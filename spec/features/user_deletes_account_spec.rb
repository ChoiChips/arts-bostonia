require 'rails_helper'

feature 'user deletes their account ', %Q{
  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app
} do
  scenario 'successfully delete account' do
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

    click_button 'Cancel my account'

    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Log in')
  end
end
