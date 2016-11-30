class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_account_update_params, if: :devise_controller?

protected

def after_sign_in_path_for(users)
  
end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :type, :company_name, :username, :contact_number, :email, :password, :password_confirmation])
  end

end



end
