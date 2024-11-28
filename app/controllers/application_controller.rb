class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :require_login
  skip_before_action :require_login, only: [:index, :create, :login, :signup]

  allow_browser versions: :modern
  private
  def require_login
    unless session[:current_user_id]
      redirect_to "/login" unless login_path?(request.path)
    end
  end

  private
  def login_path?(path)
    ["/login", "/login/create", "/signup"].include?(path)
  end
end
