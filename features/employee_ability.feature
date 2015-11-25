Feature: Ability of employee
  Background: 
    Given a user exists with email "employee@ezeratech.com", password "asdasd123" and name "Developer"

  Scenario: View employee profile
    Given I signed in as "employee@ezeratech.com" and password "asdasd123"
    And I'm on the dashboard page
    When I click on "My Profile" link with email "employee@ezeratech.com"
    Then I should be able to see my profile with email "employee@ezeratech.com"

