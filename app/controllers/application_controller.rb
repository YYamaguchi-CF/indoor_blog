class ApplicationController < ActionController::Base
	before_action :set_search

	include SessionsHelper
  
  def set_search
		@q = Blog.includes(:user).order(created_at: :desc).ransack(params[:q])
   	@blogs = @q.result(distinct: true).page(params[:page]).per(5)
   	flash.now[:info] = params[:q][:title_or_body_or_user_name_has_every_term] + "で検索しました。" if params[:q].present?
	end

  private
  
  def login_required
  	redirect_to root_path unless current_user
  end
  
  def counts(user)
  	@count_followings = user.followings.count
  	@count_followers = user.followers.count
  end
end
