class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :telephone, :bloodtype, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :telephone, :bloodtype, :email, :password, :current_password)
    end
  end
end
