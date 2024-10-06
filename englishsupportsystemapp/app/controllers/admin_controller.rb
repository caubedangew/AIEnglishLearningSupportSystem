class AdminController < ApplicationController
  before_action :authorize_admin

  private
    def authorize_admin
      authorize User, policy_class: AdminPolicy
    end
end
