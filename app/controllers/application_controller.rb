class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:usuario_id, :email, :password, :password_confirmation) }
	    devise_parameter_sanitizer.permit(:edit) { |u| u.permit(:usuario_id, :email, :password, :password_confirmation, :current_password, :sms, :avatar, :senha_provisoria => "" ) }
	    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:usuario_id, :email, :password, :password_confirmation, :current_password, :senha_provisoria => "" ) }
	 end
end
