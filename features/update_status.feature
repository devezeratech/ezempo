Feature: Status Update of Employee
  Background: 
    Given a user exists with email "employee@ezeratech.com" and name "employee"

  Scenario: Update Personal Info
    Given I'm on the profile page with email "employee@ezeratech.com"
    And I should see a status box
    When I fill in "Saya Lapar" for the status in the status section
    And I click on the "Update Status" button
    Then my status should be updated    