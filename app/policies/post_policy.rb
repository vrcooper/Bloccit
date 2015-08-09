class PostPolicy < ApplicationPolicy

    def index?
    
    true
    
    end

    

  class Scope < Scope
    
  end

    def resolve
      
      
    
      if user.admin? || user.moderator?
      scope.all
     
      elsif user.member?
        scope.where(:id => record.id).exists?


      else
        
        return scope.none if user.guest? || user.nil?
        
      end

    end
end

  

   
  

