class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      render json: @user, status: 200
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def register
    @user = User.new(user_params)
    @user.role = "user"

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :bad_request
    end

  end

  private
    def user_params
      params.permit(:first_name, :last_name, :username,
                    :password, :email, :date_of_birth, 
                    :gender, :english_level)
    end
end