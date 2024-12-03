class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  skip_before_action :verify_authenticity_token

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :require_login
  
  allow_browser versions: :modern
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
