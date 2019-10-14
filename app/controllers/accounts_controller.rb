class AccountsController < ApplicationController
  before_action :login_required
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user

    if @user.update(account_params)
      flash[:success] = 'アカウント情報を更新しました。'
      redirect_to account_path
    else
      flash.now[:danger] = '更新できませんでした。'
      render 'edit'
    end
  end
  
  private
  
  def account_params
    params.require(:account).permit(
      :name, 
      :email
      )
  end
  
end
