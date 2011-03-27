class User::Group
  
  begin # constants
    ADMINISTRATOR = 'administrator' 
  end
  
  def initialize(id)
    @id = id
  end
  
  def administrator?
    @id == ADMINISTRATOR
  end
  
end

