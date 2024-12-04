class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :require_login
  helper_method :current_user

  allow_browser versions: :modern
  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def authenticate_user!
    redirect_to '/' unless current_user
  end
  private
  def require_login
    unless session[:current_user_id]
      redirect_to login_path unless login_path?(request.path)
    end
  end

  private
  def login_path?(path)
    [login_path, login_create_path, "/signup"].include?(path)
  end
end
