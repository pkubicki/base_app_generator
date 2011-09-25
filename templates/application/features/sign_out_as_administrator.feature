Feature: Sign out form administrator account
  In order to protect access to some special functionalities
  As administrator
  I want to be able to sign out

  Background:
    Given I am logged in as "administrator"

  Scenario: Availability of sing out button
    Then the "sign_out_btn" button should contain "Wyloguj" within ".sign-in-sign-out-wrap"

  Scenario: Sign out from administrator account
    When I press "sign_out_btn" within ".sign-in-sign-out-wrap"
    Then I am on the home page
