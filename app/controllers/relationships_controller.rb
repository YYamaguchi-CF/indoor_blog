class RelationshipsController < ApplicationController
  before_action :login_required

  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    flash[:success] = user.name + 'さんをフォローしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    flash[:danger] = user.name + 'さんのフォローを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end