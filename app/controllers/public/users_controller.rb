class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  def unsubscribe
    # @user = User.find_by(email: params[:email])
    @user = User.find(params[:id])
  end
  
  def withdraw
    # @user = User.find_by(email: params[:email])
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to request.referer
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end