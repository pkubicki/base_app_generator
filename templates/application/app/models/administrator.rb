class Administrator < ActiveRecord::Base

  begin # settings
    has_one :user, :as => :account
    accepts_nested_attributes_for :user
    cattr_accessor :per_page
    self.per_page = 10
  end

  begin # validations
    validates :name, 
      :presence => true
    validates :surname, 
      :presence => true
  end

  begin # callbacks
    before_validation :assign_user_account
    before_save :presence_of_user
  end
  
  def to_s
    "#{name} #{surname}"
  end

  private

  def assign_user_account
    user.account = self if user
  end

  def presence_of_user
    user or raise 'User must be assigned!!!'
  end

end
