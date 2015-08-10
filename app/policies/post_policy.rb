class PostPolicy < ApplicationPolicy

    def index?
    
    true
    
    end

    

  class Scope < Scope
    # ivars in this clas are: user, scope

    def resolve
      # Post is scope
      return scope.none if user.nil?
    
      if user.admin? || user.moderator?
        Post.all
      else
        Post.where(:user_id => user.id)
      end
    end
  end
end

  

   
  

