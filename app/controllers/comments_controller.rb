class CommentsController < ApplicationController
	before_action :login_required
	
  def create
  	blog = Blog.find(params[:blog_id])
  	@comment = blog.comments.build(comment_params)
  	@comment.user_id = current_user.id
  	if @comment.save
  		flash[:success] = 'コメントしました。'
  		redirect_back(fallback_location: root_path)
  	else
  		flash[:danger] = 'コメントできませんでした。'
  		redirect_back(fallback_location: root_path)
  	end
  end
  
  def destroy
  	blog = Blog.find(params[:blog_id])
  	@comment = blog.comments.find(params[:id])
  	@comment.destroy
  	flash[:danger] = 'コメントを削除しました。'
  	redirect_back(fallback_location: root_path)
  end
  
  private
  
  def comment_params
  	params.require(:comment).permit(:content, :user_id)
  end
end
