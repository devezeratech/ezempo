Feature: Info Update of Employee
  Background: 
    Given a user exists with email "employee@ezeratech.com" and name "employee" and contact_number "010-1234567"  

  Scenario: Update Personal Info
    Given I'm on the dashboard page
    When I click on "My Setting" link with email "employee@ezeratech.com"
    Then I should be able to update my contact_number from "010-1234567" to "013-1234567"