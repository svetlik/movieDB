require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid', 'valid@example.com', 'password', 'password'

    expect(page).to have_content('Log out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid', 'invalid_email', 'password', 'password'

    expect(page).to have_content('Email is invalid')
  end

  scenario 'with blank password' do
    sign_up_with 'invalid', 'valid@example.com', '', ''

    expect(page).to have_content('Password is too short')
  end

  scenario 'with different passwords' do
    sign_up_with 'invalid', 'valid@example.com', '123456789', '987654321'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  def sign_up_with(name, email, password, password_confirmation)
    visit signup_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation
    click_button 'Create my account'
  end
end
