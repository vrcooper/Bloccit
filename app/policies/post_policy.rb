class PostPolicy < ApplicationPolicy
  def index?
    true
  end
end

def destroy?
  user.present? && (record.user == user || user.admin? || user.moderator?)
end
