class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  private

  # def require_login
  #   unless session[:current_user_id]
  #     if request.path == '/login' || request.path == '/login/create'
  #       return
  #     end
  #     redirect_to '/login'  # Redirect to the login page if not logged in
  #   end
  # end

end
