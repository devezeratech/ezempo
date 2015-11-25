Feature: Info Update of Employee
  Background: 
    Given a user exists with email "employee@ezeratech.com", password "asdasd123" and name "Developer"
    And I signed in as "employee@ezeratech.com" and password "asdasd123"

  Scenario: Update Personal Info
    Given I'm on the User Profile page with email "employee@ezeratech.com"
    And my position is "Developer" with email "employee@ezeratech.com"
    And I click on "My Setting" link 
    When I fill in new position "Senior Developer" 
    And I click on "Save Personal Info" button
    Then I should be able to update my position from "Developer" to "Senior Developer" with email "employee@ezeratech.com"
