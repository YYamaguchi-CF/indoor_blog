class UsersController < ApplicationController
  before_action :login_required, except: [:new, :create, :show]
  
  def new
    @user = User.new
    
    render layout: false
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:primary] = 'ユーザーを新規登録しました。ログインしてください。'
      redirect_to root_path
    else
      render 'new', layout: false
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(
      :name, 
      :introduce, 
      :email, 
      :password, 
      :password_confirmation,
      :image
      )
  end
  
end
