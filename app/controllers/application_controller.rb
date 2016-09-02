class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nome, :email, :telemovel,:password, :password_confirmation, :morador_id, roles: []) }
    devise_parameter_sanitizer.permit(:edit) { |u| u.permit(:nome, :email, :telemovel,:password, :password_confirmation, :morador_id, roles: []) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nome, :email, :telemovel,:password, :password_confirmation, :morador_id, roles: [])}
  end


end
