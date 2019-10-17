class FavoritesController < ApplicationController
  def create
  	blog = Blog.find(params[:blog_id])
  	current_user.like(blog)
  	flash[:success] = 'いいねをしました。'
  	redirect_back(fallback_location: root_path)
  end
  
  def destroy
  	blog = Blog.find(params[:blog_id])
  	current_user.unlike(blog)
  	flash[:success] = 'いいねを解除しました'
  	redirect_back(fallback_location: root_path)
  end
end
