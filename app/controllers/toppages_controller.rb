class ToppagesController < ApplicationController
  def index
    @blogs = Blog.order(created_at: :desc).page(params[:page]).per(5)
  end
end
