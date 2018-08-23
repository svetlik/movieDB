class MoviesController < ApplicationController
  def index
    @movies = Movie.order(created_at: :desc).paginate(per_page: 10, page: params[:page])
  end

  def show
    @movie = Movie.find_by(id: params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save!
      redirect_to movies_path, notice: "Movie added to the DB"
    else
      flash[:error] = 'Movie already exists in the DB'
      render :new
    end
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
  end

  def update
    @movie = Movie.find_by(id: params[:id])
    if @movie.update!(movie_params)
      redirect_to movies_path, notice: "Movie info updated"
    else
      flash[:error] = 'Invalid data'
      render :edit
    end
  end

  def destroy
    @movie = Movie.find_by(id: params[:id])
    @movie.destroy!
    redirect_to movies_path, notice: "Movie deleted"
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :text, :rating, :category_id)
  end
end
