class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	update_attributes = [:first_name, :last_name, :avatar, :description, :city, :phonenumber]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar, :city, :phonenumber])
    devise_parameter_sanitizer.permit :account_update, keys: update_attributes
  end

end
