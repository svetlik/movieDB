# README

A small implementation of a Movie database for adding, rating and filtering movies by multiple users, using Ruby on Rails, ReactJS, PostgreSQL, RSpec, Capybara, Twitter Bootstrap, and Unsemantic.

A working version can be found at https://boiling-reaches-35773.herokuapp.com.

The root page for non-logged-in visitors offers a list of the available movies.

A movie has a title, a description (or text), a rating and a category.

Movies can be filtered by category and by rating.

10 movies per page are displayed.

In order to interact with the database, a visitor has to sign up with a name, email and a password, and then log in.

After log in, several functionalities become available to the logged-in visitor:
- creation of categories
  - a category has only a name
- creation of movies
- showing, editing, deleting own movies
  - showing a movie displays movie information, including the description
- rating of movies of other users
  - a visitor can update a previously rated movie

If there are no movies entered, a message will be displayed prompting the creation of one.

Functionalities to be yet implemented:
- full-text search
- filtering withoug page reload
- rating without page reload
- graphics for rating
- responsiveness
- proper styling
