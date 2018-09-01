class RatingsController < ApplicationController
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
      redirect_to movies_path, notice: "Movie added to the DB"
    else
      flash[:error] = 'Provide rating'
      render :new
    end
  end

  def rating_params
    params.require(:rating).permit(:score, :movie_id, :user_id)
  end
end
