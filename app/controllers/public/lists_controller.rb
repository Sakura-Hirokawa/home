class Public::ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def index
    @lists = List.all
  end
  
  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to list_path(@list)
    else
      @lists = List.all
      render 'index'
    end
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
    if @list.user == current_user
      render 'edit'
    else
      redirect_to lists_path
    end
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render 'edit'
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end
  
  private
  
  def list_params
    params.require(:list).permit(:first_item, :second_item, :third_item, :date)
  end
end
