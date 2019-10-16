class BlogsController < ApplicationController
  before_action :login_required, except: [:show]
  
  def show
    @blog = Blog.find(params[:id])
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
    @blog = current_user.blogs.find(params[:id])
  end
  
  def update
    @blog = current_user.blogs.find(params[:id])
    
    if @blog.update(blog_params)
      flash[:success] = 'ブログを編集しました。'
      redirect_to blog_path(@blog)
    else
      flash.now[:danger] = 'ブログ編集が出来ませんでした。'
      render 'edit'
    end
  end
  
  def destroy
    @blog = current_user.blogs.find(params[:id])
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
      :blog_images
      )
  end
end
