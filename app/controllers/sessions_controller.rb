class SessionsController < ApplicationController
  before_action :login_required, only: [:destroy]
  
  def new
    render layout: false
  end

  def create
    user = User.find_by(email: session_params[:email])
    
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = 'ログインしました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが違います。'
      render 'new', layout: false
    end
  end

  def destroy
    reset_session
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private
  
  def session_params
    params.require(:session).permit(
      :email,
      :password
      )
  end
end
