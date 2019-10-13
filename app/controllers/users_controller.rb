class UsersController < ApplicationController
  def new
    @user = User.new
    
    render layout: false
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:primary] = 'ユーザーを新規登録しました。'
      redirect_to root_path
    else
      render 'new', layout: false
    end
  end

  def show
  end

  def edit
  end
  
  private
  
  def user_params
    params.require(:user).permit(
      :name, 
      :introduce, 
      :email, 
      :password, 
      :password_confirmation
      )
  end
  
end
