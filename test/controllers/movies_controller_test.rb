require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get movies list' do
    get movies_url
    assert_response :success
    assert_select "title", "MovieDB"
  end

  test "should get new" do
    get new_movie_url
    assert_response :success
  end
end
