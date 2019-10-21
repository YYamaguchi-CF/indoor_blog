class BlogsController < ApplicationController
  before_action :correct_blog, only: [:edit, :update, :destroy]
  before_action :login_required, except: [:show]
  before_action :set_blog, only: [:edit, :update, :destroy]
  
  def show
    @blog = Blog.find(params[:id])
    @likes_count = Favorite.where(blog_id: @blog.id).count
    @comments = @blog.comments.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
    @comment = @blog.comments.build(user_id: current_user.id) if current_user
  end

  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user

    if @blog.save
      flash[:success] = 'ブログを投稿しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ブログを投稿出来ませんでした。'
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @blog.update(blog_params)
      flash[:success] = 'ブログを編集しました。'
      redirect_to blog_path(@blog)
    else
      flash.now[:danger] = 'ブログ編集が出来ませんでした。'
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    flash[:warning] = 'ブログを削除しました。'
    redirect_to root_url
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(
      :title,
      :body,
      :janre,
      :blog_images,
      :remove_blog_images
      )
  end
  
  def set_blog
    @blog = current_user.blogs.find(params[:id])
  end
  
  def correct_blog
    @blog = Blog.find(params[:id])
    unless current_user == @blog.user
      redirect_back(fallback_location: root_path)
    end
  end
end
