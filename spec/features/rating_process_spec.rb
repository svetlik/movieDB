require 'rails_helper'
require 'spec_helper'

feature 'User' do
  user = FactoryBot.build(:user)

  scenario 'does not login and sees overall rating' do
    visit root_path
    rate_section = page.has_content?('Rate')
    movie_links_section = page.has_content?('Show')
    add_movie_section = page.has_content?('Add new movie')

    expect(rate_section).not_to be_present
    expect(movie_links_section).not_to be_present
    expect(add_movie_section).not_to be_present
  end

  scenario 'logs in and creates a category' do
    log_in_with user.email, user.password
    click_link('Add new category')
    fill_in('Name', with: 'Documentary')
    click_button('Save')
    new_category = find_link('Documentary')

    expect(new_category).to be_present
  end

  scenario 'logs in and creates a movie' do
    category = Category.last || FactoryBot.create(:category)

    log_in_with user.email, user.password
    click_link('Add new movie')
    fill_in('Title', with: 'Get Out')
    fill_in('Text', with: 'Lorem ipsum')
    page.select '4', from: 'movie_rating'
    page.select category.name, from: 'movie_category_id'
    find('#movie_category_id', text: category.name).click
    click_button('Save')
    new_movie = page.has_content?('Get Out')
    movie_links_section = page.has_content?('Show')

    expect(new_movie).to be_present
    expect(movie_links_section).to be_present
  end

  # scenario 'logs in as author and shows movie' do
  #   category = Category.last || FactoryBot.create(:category)

  #   log_in_with user.email, user.password
  #   click_link('Add new movie')
  #   fill_in('Title', with: 'Get Out')
  #   fill_in('Text', with: 'Lorem ipsum')
  #   page.select '4', from: 'movie_rating'
  #   page.select category.name, from: 'movie_category_id'
  #   click_button('Save')

  #   find('.logout').click

  #   log_in_with user.email, user.password

  #   click_link('Show')

  #   movie_details = page.has_content?('Lorem ipsum')

  #   expect(movie_details).to be_present
  # end

  scenario 'login as author and edits movie' do
    category = Category.last || FactoryBot.create(:category)
    category_action = FactoryBot.create(:category, id: 2, name: 'Action')

    log_in_with user.email, user.password
    click_link('Add new movie')
    fill_in('Title', with: 'Get Out')
    fill_in('Text', with: 'Lorem ipsum')
    page.select '4', from: 'movie_rating'
    page.select category.name, from: 'movie_category_id'
    find('#movie_category_id', text: category.name).click
    click_button('Save')

    find('.logout').click

    log_in_with user.email, user.password

    click_link('Edit')

    fill_in('Title', with: 'Need For Speed')
    fill_in('Text', with: 'Lorem ipsum NFS')
    page.select '3', from: 'movie_rating'
    page.select category_action.name, from: 'movie_category_id'

    click_button('Update')

    movie_details = page.has_content?('Need For Speed')

    expect(movie_details).to be_present
  end

  scenario 'login as author and deletes movie' do
    category = Category.last || FactoryBot.create(:category)

    log_in_with user.email, user.password
    click_link('Add new movie')
    fill_in('Title', with: 'Get Out')
    fill_in('Text', with: 'Lorem ipsum')
    find('#movie_rating', text: '4').click
    page.select '4', from: 'movie_rating'
    page.select category.name, from: 'movie_category_id'
    find('#movie_category_id', text: category.name).click
    click_button('Save')

    find('.logout').click

    log_in_with user.email, user.password

    click_link('Delete')

    movie_details = page.has_content?('Get Out')

    expect(movie_details).not_to be_present
  end

  scenario 'logs in as another user and rates movie' do
    jack = FactoryBot.create(:user, :jack)
    category = Category.last || FactoryBot.create(:category)

    log_in_with user.email, user.password
    click_link('Add new movie')
    fill_in('Title', with: 'Get Out')
    fill_in('Text', with: 'Lorem ipsum')
    page.select '4', from: 'movie_rating'
    page.select category.name, from: 'movie_category_id'
    find('#movie_category_id', text: category.name).click
    click_button('Save')

    find('.logout').click

    log_in_with jack.email, jack.password

    click_link('Rate')
    page.select '4', from: 'rating_score'
    click_button('Save')

    update_rating = page.has_content?('Update rating of 4')

    expect(update_rating).to be_present
  end

  scenario 'logs in as another user and updates rating' do
    jack = FactoryBot.create(:user, :jack)
    category = Category.last || FactoryBot.create(:category)

    log_in_with user.email, user.password
    click_link('Add new movie')
    fill_in('Title', with: 'Get Out')
    fill_in('Text', with: 'Lorem ipsum')
    page.select '4', from: 'movie_rating'
    page.select category.name, from: 'movie_category_id'
    find('#movie_category_id', text: category.name).click
    click_button('Save')

    find('.logout').click

    log_in_with jack.email, jack.password

    click_link('Rate')
    page.select '4', from: 'rating_score'
    click_button('Save')

    click_link('Update rating of 4')

    page.select '3', from: 'rating_score'
    click_button('Save')

    update_rating = page.has_content?('Update rating of 3')

    expect(update_rating).to be_present
  end

  def log_in_with(email, password)
    visit login_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
