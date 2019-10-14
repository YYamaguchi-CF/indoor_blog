class PasswordsController < ApplicationController
  before_action :login_required
  
  def show
    redirect_to account_path
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    current_password = password_params[:current_password]
    
    if current_password.present?
      if @user.authenticate(current_password)
        @user.assign_attributes(password_params)
        if @user.save
          flash[:success] = 'パスワードを変更しました。'
          redirect_to account_path
        else
          flash.now[:danger] = 'パスワード変更に失敗しました'
          render 'edit'
        end
      else
        @user.errors.add(:current_password, :wrong)
        flash.now[:danger] = 'パスワード変更に失敗しました'
        render 'edit'
      end
    else
      @user.errors.add(:current_password, :empty)
      flash.now[:danger] = 'パスワード変更に失敗しました'
      render 'edit'
    end
  end
  
  private
  
  def password_params
    params.require(:account).permit(
      :current_password,
      :password, 
      :password_confirmation
      )
  end
end
