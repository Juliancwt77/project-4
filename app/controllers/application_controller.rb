class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_sign_up_params, if: :devise_controller?
  before_filter :configure_account_update_params, if: :devise_controller?


protected

def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :type, :company_name, :username, :contact_number, :email, :password, :password_confirmation])
end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :type, :company_name, :username, :contact_number, :email, :password, :password_confirmation])
  end





end
