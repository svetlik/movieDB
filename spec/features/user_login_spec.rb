require 'rails_helper'
require 'spec_helper'

feature 'User signs up' do
  user = FactoryBot.build(:user)

  scenario 'with invalid email and password' do
    log_in_with user.email, user.password

    expect(page).to have_content('Log out')
  end

  scenario 'with blank password' do
    log_in_with 'valid@example.com', ''

    expect(page).to have_content('Log in')
  end

  scenario 'with invalid email' do
    log_in_with 'invalid_email', 'password'

    expect(page).to have_content('Log in')
  end

  scenario 'with valid credentials and log out' do
    log_in_with user.email, user.password

    find('.logout').click

    expect(page).to have_content('Log in')
  end


  def log_in_with(email, password)
    visit login_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
