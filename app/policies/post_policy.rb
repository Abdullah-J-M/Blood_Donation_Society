class PostPolicy < ApplicationPolicy
  def destroy?
    true if user.admin?
  end
end
# if user.role == 'admin' || record.user == user
# end
