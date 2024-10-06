class AdminPolicy < ApplicationPolicy
  def index?
    user.present? && user.role == 'admin'
  end

  def show?
    user.present? && user.role == 'admin'
  end

  def create?
    user.present? && user.role == 'admin'
  end

  def new?
    user.present? && user.role == 'admin'
  end

  def update?
    user.present? && user.role == 'admin'
  end

  def edit?
    user.present? && user.role == 'admin'
  end

  def destroy?
    user.present? && user.role == 'admin'
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
