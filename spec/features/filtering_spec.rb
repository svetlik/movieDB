require 'rails_helper'
require 'spec_helper'

feature 'User' do
  user = FactoryBot.build(:user)
  category = Category.first || FactoryBot.create(:category)
  category_action = Category.second || FactoryBot.create(:category, id: 2, name: 'Action')

  scenario 'logs in and filters movie by category' do
    setup_movies(user, category, category_action)

    movie_details = page.has_content?('Horror (1)')

    click_link('Horror')
    other_movie_details = page.has_content?('Tomb Raider')

    expect(other_movie_details).not_to be_present
  end

  scenario 'logs in and filters movie by category' do
    setup_movies(user, category, category_action)

    movie_details = page.has_content?('4 (2)')

    click_link('4')
    other_movie_details = page.has_content?('Need For Speed')

    expect(other_movie_details).not_to be_present
  end

  def log_in_with(email, password)
    visit login_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  def create_movie(user, name, text, rating, category)
    log_in_with user.email, user.password
    click_link('Add new movie')
    fill_in('Title', with: name)
    fill_in('Text', with: text)
    page.select rating, from: 'movie_rating'
    page.select category.name, from: 'movie_category_id'
    find('#movie_category_id', text: category.name).click
    click_button('Save')
  end

  def setup_movies(user, category, secondary_category)
    create_movie(user, 'Get Out', 'Lorem ipsum', '4', category)
    create_movie(user, 'Need For Speed', 'Lorem ipsum NFS', '3', secondary_category)
    create_movie(user, 'Tomb Raider', 'Lorem ipsum TR', '4', secondary_category)
  end
end
