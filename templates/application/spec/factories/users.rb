Factory.define :user do |f|
  f.sequence(:login) { |n| "login#{n}" }
  f.email {|u| "#{u.login}@example.com" }
  f.password "secret"
  f.password_confirmation {|u| u.password }
end

Factory.define :user_with_administrator_group, :parent => :user do |f|
  f.association :account, :factory => :administrator
end

Factory.define :administrator do |f|
  f.sequence(:name) { |n| "Name_#{n}" }
  f.sequence(:surname) { |n| "Surname_#{n}" }
  f.user_attributes do |a|
    Factory.attributes_for(:user, :login => "#{a.name}.#{a.surname}")
  end

end
