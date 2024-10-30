class UserPolicy < ApplicationPolicy
  def index?
    user.present? && user.role == "user"
  end

  def show?
    user.present? && user.role == "user"
  end

  def create?
    user.present? && user.role == "user"
  end

  def new?
    user.present? && user.role == "user"
  end

  def update?
    user.present? && user.role == "user"
  end

  def edit?
    user.present? && user.role == "user"
  end

  def destroy?
    user.present? && user.role == "user"
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
