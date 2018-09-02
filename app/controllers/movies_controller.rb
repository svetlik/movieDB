class MoviesController < ApplicationController
  before_action :set_category
  before_action :set_rating

  def index
    @movies = scope.paginate(per_page: 10, page: params[:page])
    respond_to do |format|
      format.json {render json: @movies}
      format.html
    end
  end

  def show
    @movie = Movie.find_by(id: params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      Rating.create(score: @movie.rating, user: current_user, movie: @movie)
      redirect_to movies_path, notice: "Movie added to the DB"
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
  end

  def update
    @movie = Movie.find_by(id: params[:id])
    @rating = Rating.find_by(movie: @movie, user: current_user)
    if @movie.update(movie_params)
      @rating.score = @movie.rating
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
    params.require(:movie).permit(:title, :text, :rating, :category_id).merge(author_id: current_user.id)
  end

  def set_category
    @category = params[:category]
  end

  def set_rating
    @rating = params[:rating]
  end

  def scope
    return Movie.by_category(@category) if @category.present?
    return Movie.by_rating(@rating) if @rating.present?

    Movie.order(created_at: :desc)
  end
end
