class Admin::ListCommentsController < ApplicationController
  
  def destroy
    ListComment.find_by(id: params[:id], list_id: params[:list_id]).destroy
    redirect_to edit_admin_list_path(params[:list_id])
  end
end
