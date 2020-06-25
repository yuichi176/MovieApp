class MovieController < ApplicationController
  before_action :authenticate_user

  def index
    @movies = Movie.all.order(created_at: :desc)
  end

  def show
    @movie = Movie.find_by(id: params[:id])
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
  end

  def update
    @movie = Movie.find_by(id: params[:id])
    @movie.title = params[:title]
    @movie.rating = params[:rating]
    @movie.feelings = params[:feelings]
    if @movie.save
      flash[:notice] = "編集しました"
      redirect_to("/movie/index")
    else
      render("movie/edit")
    end
  end

  def destroy
    @movie = Movie.find_by(id: params[:id])
    @movie.destroy
    flash[:notice] = "削除しました"
    redirect_to("/movie/index")
  end

  def new
    @movie = Movie.new
  end

  def create
  @movie = Movie.new(
  title: params[:title],
  rating: params[:rating],
  feelings: params[:feelings]
)
#追加日時
  require "date"
  now = Date.today
  add_date = "#{now.year}/#{now.month}/#{now.day}"
  @movie.add_date = add_date

if @movie.save
  flash[:notice] = "追加しました"
  redirect_to("/movie/index")
else
  render("movie/new")
end
  end

end
