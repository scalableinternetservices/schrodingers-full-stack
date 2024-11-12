class LoginController < ApplicationController
  def index
    if !session[:current_user_id] 
      @user = User.new
    else
      redirect_to '/'
    end

  end
  def create
    @user = User.find_by(username: user_params[:username])
    if @user 
      redirect_to '/'
      session[:current_user_id] = @user.username
    else
      @user = User.new(user_params)
      if @user.save
        redirect_to '/'
        session[:current_user_id] = @user.username
      else
        render :new, status: :unprocessable_entity
      end
    end
  end
  
  def destroy
    session[:current_user_id] = nil
    redirect_to '/', notice: 'Logged out successfully'
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
