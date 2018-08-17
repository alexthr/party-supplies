class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # after_action :clean_query_param

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar, :bio])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar, :bio])
  end
  
  def clean_query_param
    session[:query_param] = ""
  end
end
