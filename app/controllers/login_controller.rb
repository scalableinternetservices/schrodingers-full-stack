class LoginController < ApplicationController
  def index
    if session[:current_user_id]
      redirect_to "/", notice: "You are already logged in."
    else
      @user = User.new
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])  # Change to password
      session[:current_user_id] = @user.username
      redirect_to "/", notice: "Logged in successfully."
    else
      flash[:alert] = "Invalid username or password."
      redirect_to login_path
    end
  end


  def signup
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.username
      redirect_to "/", notice: "Account created successfully."
    else
      if @user.errors[:username].include?("has already been taken")
        flash[:alert] = "The username is already taken. Please choose another one."
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
      end
      redirect_to login_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to "/", notice: "Logged out successfully."
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
