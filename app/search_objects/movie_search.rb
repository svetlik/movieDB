class MovieSearch < BaseSearch
  include SearchObject.module
    scope { Movie.all }


  end
end
