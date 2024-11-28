class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # before_action :require_login
  
  allow_browser versions: :modern
  private
  def require_login
    if session[:current_user_id] && request.path == "/login"
      redirect_to "/" # Home page
      return
    end
    unless session[:current_user_id]
      if request.path == "/login" || request.path == "/login/create" || request.path == "/signup"
        return
      end
      redirect_to "/login"  # Redirect to the login page if not logged in
    end
  end
end
