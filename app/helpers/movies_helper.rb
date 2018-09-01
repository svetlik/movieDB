module MoviesHelper
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

  def movies_rated(num)
    Movie.all.select do |movie|
      (num...num+1).member?(calculate_rating(movie).to_f)
    end
  end
end
