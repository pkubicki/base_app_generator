class User < ActiveRecord::Base

  begin # settings
    acts_as_authentic do |c|
      c.maintain_sessions = false
    end
    belongs_to :account, :polymorphic => true
    belongs_to :added_by, :class_name => "User", :foreign_key => "added_by_id"
  end
  
  begin # validations
    validates :account, 
      :presence => true
    validates :account_type, 
      :presence => true
  end

  def group_name
    account_type.underscore
  end

  def group
    User::Group::new(account_type.underscore)
  end

end
