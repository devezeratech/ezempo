Feature: Status Update of Employee
  Background: 
    Given a user exists with email "employee@ezeratech.com", password "asdasd123" and name "Developer"
    And I signed in as "employee@ezeratech.com" and password "asdasd123"

  Scenario: Update Personal Info
    Given I'm on the profile page with email "employee@ezeratech.com"
    And I should see a status text field
    When I fill in "Saya Lapar" as the status
    And I click on the "UPDATE STATUS" button
    Then my status should be updated    