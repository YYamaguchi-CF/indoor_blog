class UsersController < ApplicationController
  before_action :login_required, except: [:new, :create, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :likes]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
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
    @blogs = @user.blogs.order(created_at: :desc).page(params[:page]).per(25)
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = 'マイページを変更しました。'
      redirect_to @user
    else
      flash.now[:warning] = '変更に失敗しました。'
      render 'edit'
    end
  end
  
  def destroy
    @user.destroy
    flash[:warning] = '退会しました。'
    redirect_to root_url
  end
  
  def likes
    @favoblogs = @user.favoblogs.page(params[:page]).per(5)
  end
  
  private
  
  def user_params
    params.require(:user).permit(
      :name, 
      :introduce, 
      :email, 
      :password, 
      :password_confirmation,
      :image,
      :remove_image
      )
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    set_user
    unless current_user == @user
      redirect_to root_url
    end
  end  
end
