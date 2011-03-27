Feature: Sign out form administrator account
  In order to protect access to some special functionalities
  As administrator
  I want to be able to sign out

  Background:
    Given I am logged in as "administrator"

  Scenario: Availability of sing out button
    Then the "sign_out_btn" button within ".button_to" should contain "Wyloguj"

  Scenario: Sign out from administrator account
    When I press "sign_out_btn" within ".button_to"
    Then I am on the home page
