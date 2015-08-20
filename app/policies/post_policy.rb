class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.moderator?
        scope.all
      elsif user.present?
        scope.where(user_id: @user)
      end
    end
  end    
  
  def index?
    user.admin? || user.moderator? || user.present?
  end
  
 end #Class PostPolicy