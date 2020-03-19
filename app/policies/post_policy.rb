class PostPolicy < ApplicationPolicy
  def destroy?
    true if user.admin?
  end
end
