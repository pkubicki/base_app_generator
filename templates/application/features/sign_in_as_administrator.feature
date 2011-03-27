Feature: Sign in as administrator
  In order to get access to protected functionality of the application
  As an administrator
  I want to be able to sign in

  Scenario: Sing in with bad login
    Given I am on the sign in page
      And no user exists with a login of "notexistinguser"
    When I fill in the following:
      | user_session_login    | notexistinguser@example.com |
      | user_session_password | secret                      |
      And I press "Zaloguj"
    Then I should be on sign_in
      And I should see "Login jest nieprawidłowy"

  Scenario: Sing in with proper login or password
    Given an user_with_administrator_group exists with login: "admin", password: "secret"
      And I am on the sign in page
    When I fill in the following:
      | user_session_login    | admin  |
      | user_session_password | secret |
      And I press "Zaloguj"
    Then I should be on path "/admin_dashboard"
      And I should see "Logowanie zakończone powodzeniem"

