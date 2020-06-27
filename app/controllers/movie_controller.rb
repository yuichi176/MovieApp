class MovieController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit,:update,:destroy]}

  def index
    @movies = @current_user.movies
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @user = @movie.user
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
      redirect_to("/movie/#{@current_user.id}/index")
    else
      if(@movie.title=="")
        @notitle="タイトルを入力してください"
      end
      if(!@movie.rating)
        @norating="評価を入力してください"
      end
      render("movie/edit")
    end
  end

  def destroy
    @movie = Movie.find_by(id: params[:id])
    #usersテーブルのsum_moviesを更新
    @user = @movie.user
    @user.declement_count_movie
    @movie.destroy
    flash[:notice] = "削除しました"
    redirect_to("/movie/#{@current_user.id}/index")
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(
    title: params[:title],
    rating: params[:rating],
    feelings: params[:feelings],
    user_id: @current_user.id
  )
    #追加日時
    require "date"
    now = Date.today
    add_date = "#{now.year}/#{now.month}/#{now.day}"
    @movie.add_date = add_date

    if @movie.save
      #usersテーブルのsum_moviesを更新
      @user = @movie.user
      @user.inclement_count_movie
      flash[:notice] = "追加しました"
      redirect_to("/movie/#{@current_user.id}/index")
    else
      if(@movie.title=="")
        @notitle="タイトルを入力してください"
      end
      if(!@movie.rating)
        @norating="評価を入力してください"
      end
      render("movie/new")
    end
  end

  def ensure_correct_user
    @post = Movie.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/movie/#{@current_user.id}/index")
    end
  end

end
