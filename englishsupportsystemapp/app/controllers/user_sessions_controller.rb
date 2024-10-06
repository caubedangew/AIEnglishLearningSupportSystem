class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "Wrong username or password."
      redirect_to :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
