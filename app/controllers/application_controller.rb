class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_paramater_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :name)
    end
  end
end
