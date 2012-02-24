Feature: User authorization
  As an user
  I want sign in

  Scenario: User signs in with valid data
    Given I am exist as a user
    And I am not logged in
    When I sign in with email "test@test.ru" and password "123456"
    Then I should see a message "Logged in as test@test.ru"

  Scenario: Unregistered user
    Given I am not existing user with email "unregistered@test.ru"
    And I am not logged in
    When I sign in with email "unregistered@test.ru" and password "654321"
    Then I should see a message "Invalid email or password"

  Scenario: User sign in with invalid password
    Given I am exist as a user
    And I am not logged in
    When I sign in with email "test@test.ru" and password "654321"
    Then I should see a message "Invalid email or password"