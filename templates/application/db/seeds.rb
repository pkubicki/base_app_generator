Administrator.create! do |a|
  a.name = "Joe"
  a.surname = "Doe"
  a.user_attributes = {
    :login => 'joe.doe',
    :email => 'joe.doe@example.com',
    :password => 'secret',
    :password_confirmation => 'secret'
  }
end

