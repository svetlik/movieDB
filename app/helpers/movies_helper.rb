module MoviesHelper
  def rating_list
    hsh = {}
    [1, 2, 3, 4, 5].each do |num|
      hsh[num]= Movie.where(rating: num).count
    end

    hsh
  end

  def category_list
    hsh = {}

    Category.all.each do |category|
      hsh[category.to_json] = Movie.where(category: category).count
    end

    hsh.to_json
  end

  def calculate_rating(movie)
    sum = 0
    all_ratings = Rating.where(movie: movie)
    all_ratings.each {|rating| sum += rating.score }

    '%.2f' % (sum / all_ratings.count.to_f)
  end

  def user_is_author_of(movie)
    movie.author_id == current_user.id
  end

  def already_rated(movie)
    user_rating(movie).present?
  end

  def user_rating(movie)
    rating = Rating.find_by(movie: movie, user: current_user)
    rating.score if rating.present?
  end
end
