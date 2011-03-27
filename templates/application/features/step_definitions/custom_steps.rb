Given /^no user exists with a login of "([^"]*)"$/ do |login|
  User.find_by_login(login).should be_nil
end

Given /^I am logged in as "([^"]*)"$/ do |user_group|
  user_attributes = Factory.attributes_for(:user, :password => 'secret')
  administrator = Factory(user_group, :user_attributes => user_attributes)
  visit path_to(sign_in_path)
  fill_in('user_session_login', :with => administrator.user.login)
  fill_in('user_session_password', :with => user_attributes[:password])
  click_button('sign_in_btn')
end

Then /^the "([^"]*)" button(?: within "([^"]*)")? should contain "([^"]*)"$/ do |button, selector, value|
  with_scope(selector) do
    button_value = find_button(button).value
    if button_value.respond_to? :should
      button_value.should =~ /#{value}/
    else
      assert_match(/#{value}/, button_value)
    end
  end
end

Given(/^#{capture_model} exists?(?: with #{capture_fields}) and I am on its show page$/) do |name, fields|
  record = create_model(name, fields)
  visit("/#{name.pluralize}/#{record.id}")
end
