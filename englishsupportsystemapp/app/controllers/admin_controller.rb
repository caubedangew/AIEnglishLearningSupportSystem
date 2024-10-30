class AdminController < ApplicationController
  before_action :authorize_admin

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized(exception)
    redirect_to root_path
  end

  private
    def authorize_admin
      authorize User, policy_class: AdminPolicy
    end
end
