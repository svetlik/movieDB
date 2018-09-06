# README

A small implementation of a Movie database for adding, rating and filtering movies by multiple users, using Ruby on Rails, ReactJS, PostgreSQL, RSpec, Capybara, Twitter Bootstrap, and Unsemantic.

A working version can be found at https://boiling-reaches-35773.herokuapp.com.

- The root page for non-logged-in visitors offers a list of the available movies.

- A movie has a title, a description (or text), a rating and a category.

- Movies can be filtered by category and by rating.

- 10 movies per page are displayed.

- In order to interact with the database, a visitor has to sign up with a name, email and a password, and then log in.

- After login, several functionalities become available to the logged-in visitor:
  - creation of categories
    - a category has only a name
  - creation of movies
  - showing, editing, deleting own movies
    - showing a movie displays movie information, including the description
  - rating of movies of other users
    - a visitor can update a previously rated movie
  - overall rating score is calculated as the median of all users' ratings

- If there are no movies entered, a message will be displayed prompting the creation of one.


Project installation:

0. Clone this repo: navigate to the desired directory in terminal and run `git clone git@github.com:svetlik/movieDB.git`
1. Navigate to the project directory and run `bundle install && yarn install` in console
2. Run `rails s`


Functionalities to be yet implemented:
- full-text search
- filtering withoug page reload
- rating without page reload
- graphics for rating
- responsiveness
- proper styling
- combine filtering cards into one component
