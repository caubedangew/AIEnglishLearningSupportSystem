class Api::UsersController < Api::ApisController
  before_action :authenticate, only: [ :current_user ]
  protect_from_forgery with: :null_session

  def login
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      token = JsonWebToken.encode({ user_id: user.id })
      expired_at = JsonWebToken.decode(token)[:exp]
      render json: { token: token, expired_at: expired_at }, status: :ok
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  def register
    user = User.new(user_params)
    user.role = "user"
    user.english_level = 1

    if user.save
      render json: "Created successfully", status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  def current_user
    render json: @current_user, status: :ok
  end

  private
    def user_params
      params.permit(:first_name, :last_name, :username,
                    :password, :email, :date_of_birth,
                    :gender)
    end
end
