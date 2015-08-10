class SummaryPolicy <ApplicationPolicy

  
    def index?
    
    true
    
    end

    

  class Scope < Scope
    

  def resolve
      
      return scope.none if user.nil?
    
      if user.admin? || user.moderator?
      scope.all
     
      else user.member?
        scope.where(:id => record.id).exists?
        


      end
        
      
        
      end

    end
  end