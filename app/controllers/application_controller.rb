class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: "Access Denied" # was alert: exception.message ...but showed post info in error message so I changed it
  end
  
  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
