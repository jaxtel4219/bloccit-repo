class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.moderator?
        scope.all
      elsif user.present?
        scope.where(user_id: @user)
      else
        redirect_to root_url, alert: "Access Denied" 
      end
    end
  end    
  
  def index?
    user.admin? || user.moderator? || user.member?
  end
  
 end #Class PostPolicy