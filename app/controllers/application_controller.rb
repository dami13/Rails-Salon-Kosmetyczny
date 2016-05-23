class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

 
  def after_sign_out_path_for(resource_or_scope)
    admin_login_path
    end

  def after_sign_in_path_for(resource_or_scope)
    admin_login_path
  end

  def  after_sending_reset_password_instructions_path_for(resource_name)
    redirect_to 'admin#login'
  end



   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :address, :phone_number,
        :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name, :address, :phone_number,
        :email, :password, :password_confirmation, :current_password)
    end
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:email, :password)
    end
  end
end
