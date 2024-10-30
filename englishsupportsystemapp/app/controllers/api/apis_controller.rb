class Api::ApisController < ApplicationController
  before_action :authenticate

  rescue_from JWT::VerificationError, with: :invalid_token
  rescue_from JWT::DecodeError, with: :decode_error

  private
    def authenticate
      auth = request.headers["Authorization"]

      if auth
        token = auth.split(" ").last
        payload = JsonWebToken.decode(token)
        if payload["user_id"]
          user = User.find(payload["user_id"])
          @current_user = user if user
        else
          render json: "This user is invalid", status: :unauthorized
        end
      else
        render json: "You need to login to access this action!!!", status: :unauthorized
      end
    end

    def invalid_token
      render json: { invalid_token: "invalid token" }
    end

    def decode_error
      render json: { decode_error: "decode error" }
    end
end
