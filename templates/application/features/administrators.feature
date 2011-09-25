Feature: Administrators accounts management
  In order to allow other users to administrate
  An administrator
  Should be able to manage administrattors accounts

  Background:
    Given I am logged in as "administrator"

  Scenario: Following administrators link
    Given I am on the home page
    When I follow "administrators_menu_lnk"
    Then I should be on path "/administrators"

  Scenario Outline: Browsing administrators accounts list
    Given an administrator exists with name: "<name>", surname: "<surname>"
      And I am on the administrators page
    Then I should be on path "/administrators"
      And I should see "<name>"
      And I should see "<surname>"
      Examples:
        | name  | surname  |
        | Piotr | Nowak    |
        | Jan   | Kowalski |
        | Anna  | Nowa     |

  Scenario: Successful creation of new administrator
    Given I am on path "/administrators"
    When I follow "Dodaj"
      And I fill in the following:
        | administrator_name                                  | Jan                      |
        | administrator_surname                               | Kowalski                 |
        | administrator_user_attributes_login                 | jan.kowalski             |
        | administrator_user_attributes_email                 | jan.kowalski@example.com |
        | administrator_user_attributes_password              | secret                   |
        | administrator_user_attributes_password_confirmation | secret                   |
      And I press "Dodaj"
    Then I should see "Administrator został pomyślnie utworzony."
      And I should be on path "/administrators"
      And administrator should exist with name: "Jan", surname: "Kowalski"
      And user should exist with login: "jan.kowalski", email: "jan.kowalski@example.com"

  Scenario: Successful edition of existing administrator
    Given an administrator exists with name: "Jan", surname: "Kowalski"
      And I am on path "/administrators"
    When I follow "Edycja" within "section table tr:last"
      And I fill in the following:
        | administrator_surname | Nowak |
        | administrator_user_attributes_login | jan.nowak |
      And I press "Uaktualnij"
    Then I should see "Administrator został pomyślnie uaktualniony."
      And I should be on path "/administrators"
      And administrator should not exist with name: "Jan", surname: "Kowalski"
      And administrator should exist with name: "Jan", surname: "Nowak"
      And user should exist with login: "jan.nowak"

