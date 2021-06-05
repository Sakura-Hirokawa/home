class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # def after_sign_in_path_for(resource)
  #   if resorce.class.name == "Admin"
  #     admin_root_path
  #   else
  #     root_path
  #   end
  # end
  
  # def after_sign_out_path_for(resource)
  #   if resource == :admin
  #     new_admin_session
  #   else
  #     root_path
  #   end
  # end
  
  #管理者へのアクセス制限 
  # before_action :authenticate_admin!, if: admin_url
  
  # def admin_url
  #   request.fullpath.include?("/admin")
  # end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
