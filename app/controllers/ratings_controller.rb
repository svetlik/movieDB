class RatingsController < ApplicationController
  include MoviesHelper

  def new
    @movie = Movie.find_by(id: params[:movie_id])
    @rating = Rating.new
  end

  def create
    @movie = Movie.find_by(id: params[:movie_id])

    @rating = Rating.new(rating_params)
    @rating.movie = @movie
    @rating.user = current_user

    if @rating.save
      @movie.rating = calculate_rating(@movie)
      redirect_to movies_path, notice: "Movie added to the DB"
    else
      flash[:error] = 'Provide rating'
      render :new
    end
  end

  def edit
    @movie = Movie.find_by(id: params[:movie_id])
    @rating = Rating.find_by(user: current_user, movie: @movie)
  end

  def update
    @movie = Movie.find_by(id: params[:movie_id])
    @rating = Rating.find_by(movie: @movie, user: current_user)

    if @rating.update(rating_params)
      @rating.score = @movie.rating

      redirect_to movies_path, notice: "Movie info updated"
    else
      flash[:error] = 'Invalid data'
      render :edit
    end
  end

  def rating_params
    params.require(:rating).permit(:score, :movie_id, :user_id)
  end
end
