Feature: Chatting between Employees
  Background: 
    Given a user exists with email "employee@ezeratech.com", password "asdasd123" and name "Developer"
    And I signed in as "employee@ezeratech.com" and password "asdasd123"

  @javascript 
  Scenario: My chat
    Given I'm on the profile page with email "employee@ezeratech.com"
    When I click on the "quick-sidebar-show" element
    And I fill in "Hi!" to "chat_input"
    And click on the "send-chat" button
    Then the last message in the chatbox should display name "Developer" and chat "Hi!"

  @javascript 
  Scenario: When more than one user chatting
    Given a user exists with email "boss@ezeratech.com", password "asdasd123" and name "Boss"
    And I'm on the profile page with email "boss@ezeratech.com"
    When I click on the "quick-sidebar-show" element
    And I fill in "Hi! Developer" to "chat_input"
    And click on the "send-chat" button
    Then the last message in the chatbox should display name "Boss" and chat "Hi! Developers"

    Given a user exists with email "manager@ezeratech.com", password "asdasd123" and name "Manager"
    And I'm on the profile page with email "manager@ezeratech.com"
    When I click on the "quick-sidebar-show" element
    Then the last message in the chatbox should display name "Boss" and chat "Hi! Developers"
