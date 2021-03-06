class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :store_location

  def store_location
    session[:previous_url] = request.fullpath if !INVALID_REDIRECTIONS.include?(request.fullpath) && !request.xhr? # don't store ajax calls
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end
end
