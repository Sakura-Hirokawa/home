class Admin::ListsController < ApplicationController
  
  def show
    @list = List.all
    @user = User.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
    @user = User.find_by(id: @list.user_id)
  end
  
  def destroy
    @list = List.find(params[:id])
    @user = User.find_by(id: @list.user_id)
    @list.destroy
    redirect_to admin_user_path(@user)
  end
end