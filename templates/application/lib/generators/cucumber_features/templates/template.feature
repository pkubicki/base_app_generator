Feature: <%= human_name %> management

  Background:
    Given I am logged in as "administrator"

  Scenario: Following <%= table_name %> link
    Given I am on the home page
    When I follow "<%= table_name %>_menu_lnk"
    Then I should be on path "/<%= table_name %>"

  Scenario Outline: Browsing <%= table_name %> list
    Given a <%= singular_table_name %> exists with <%= attributes.map {|attribute| "#{attribute.name}: \"<#{attribute.name}>\"" }.join(', ') -%>
      And I am on the <%= table_name %> page
    Then I should be on path "/<%= table_name %>"
<% for attribute in attributes %>      And I should see "<<%= attribute.name -%>>"
<% end %>
      Examples:
        | <%= attributes.map {|attribute| attribute.name }.join(' | ') -%> |
        | <%= attributes.map {|attribute| attribute.default }.join(' | ') -%> |

  Scenario: Successful creation of new <%= singular_table_name %>
    Given I am on path "/<%= table_name %>"
    When I follow "Dodaj"
      And I fill in the following:
<% for attribute in attributes %>        | <%= singular_table_name %>_<%= attribute.name %> | <%= attribute.default %> |
<% end %>
      And I press "Dodaj"
    And I should see "<%= human_name.singularize %> został pomyślnie utworzony."
      And <%= singular_table_name %> should exist with <%= attributes.map {|attribute| "#{attribute.name}: \"#{attribute.default}\"" }.join(', ') -%>

  Scenario: Successful edition of existing <%= singular_table_name %>
    Given a <%= singular_table_name %> exists with id: 1, <%= attributes.map {|attribute| "#{attribute.name}: \"#{attribute.default}\"" }.join(', ') -%>
      And I am on path "/<%= table_name %>"
      When I follow "Edycja" within "section table tr#<%= singular_table_name %>_1"
      And I fill in the following:
<% for attribute in attributes %>        | <%= singular_table_name %>_<%= attribute.name %> | <%= attribute.default2 %> |
<% end %>
      And I press "Uaktualnij"
    Then I should see "<%= human_name.singularize %> został pomyślnie uaktualniony."
      And <%= singular_table_name %> should not exist with <%= attributes.map {|attribute| "#{attribute.name}: \"#{attribute.default}\"" }.join(', ') -%>
      And <%= singular_table_name %> should exist with <%= attributes.map {|attribute| "#{attribute.name}: \"#{attribute.default2}\"" }.join(', ') -%>

  Scenario: Successful deletion of <%= singular_table_name %>
    Given the following <%= table_name %> exists:
      | id | <%= attributes.map {|attribute| attribute.name }.join(' | ') -%> |
      | 1  | <%= attributes.map {|attribute| attribute.default }.join(' | ') -%> |
      | 2  | <%= attributes.map {|attribute| attribute.default }.join(' | ') -%> |
      | 3  | <%= attributes.map {|attribute| attribute.default }.join(' | ') -%> |
      And I am on path "/<%= table_name %>"
    When I follow "Usuń" within "section table tr:last"
    Then I should see "<%= human_name.singularize %> został pomyślnie usunięty."
      And 2 <%= table_name %> should exist

  Scenario: Browse to show page
    Given a <%= singular_table_name %> exists with id: 1, <%= attributes.map {|attribute| "#{attribute.name}: \"#{attribute.default}\"" }.join(', ') -%>
      And I am on path "/<%= table_name %>"
    When I follow "Szczegóły" within "section table tr:last"
    Then I should see "<%= attributes.first.default %>"
