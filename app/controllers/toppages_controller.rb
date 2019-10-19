class ToppagesController < ApplicationController
  def index
  end
  
  def mangas
    @blogs = Blog.manga.page(params[:page]).per(5)
  end
  
  def animes
    @blogs = Blog.anime.page(params[:page]).per(5)
  end
  
  def games
    @blogs = Blog.game.page(params[:page]).per(5)
  end
  
  def movies
    @blogs = Blog.movie.page(params[:page]).per(5)
  end
  
  def others
    @blogs = Blog.other.page(params[:page]).per(5)
  end
end
