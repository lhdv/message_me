class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: session_params[:username])
    if @user.authenticate(session_params[:password])
      session[:usr_id] = @user.id
      flash[:success] = "Login successfull"
      redirect_to root_path
    else
      flash.now[:error] = "Username and/or password invalid"
      render 'new'
    end
  end
  
  def destroy
    if session[:usr_id]
      session[:usr_id] = nil
      flash[:info] = "Logged out! See you later!"
      redirect_to root_path
    end
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end

end