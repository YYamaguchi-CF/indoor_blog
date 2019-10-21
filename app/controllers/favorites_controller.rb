class FavoritesController < ApplicationController
	before_action :login_required
	
  def create
  	blog = Blog.find(params[:blog_id])
  	current_user.like(blog)
  	flash[:success] = blog.user.name + 'さんのブログにいいねをしました。'
  	redirect_back(fallback_location: root_path)
  end
  
  def destroy
  	blog = Blog.find(params[:blog_id])
  	current_user.unlike(blog)
  	flash[:danger] = blog.user.name + 'さんのブログのいいねを解除しました'
  	redirect_back(fallback_location: root_path)
  end
end
