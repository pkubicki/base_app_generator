Feature: Static pages
  In order to get information about the company
  As a visitor
  I want to be able to browse subpages with those informations

	Scenario: Browse home page
		When I am on the home page
		Then I should see "Witaj"

	Scenario: Browse to non existing page
    When I go to non existing page
		Then I should see "404"