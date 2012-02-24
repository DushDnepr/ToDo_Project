Feature: Register new user
  As new user
  I want register with valid data

  Scenario: register user with valid data
    Given I am not logged in
    When I fill email "register@test.ru", password "qwerty" and password confirmation "qwerty"
    Then I sign in with email "register@test.ru" and password "qwerty"
    And I see page with list of my projects
    And I should see a message "Logged in as register@test.ru"

  Scenario: register user with empty email
    Given I am not logged in
    When I fill password "qwerty" and password confirmation "qwerty" without email
    Then I should see a message "Invalid email or password"

  Scenario: register user with empty password
    Given I am not logged in
    When I fill email "register@test.ru" and blank password
    Then I should see a message "Invalid email or password"

  Scenario: register user with invalid password and confirmation
    Given I am not logged in
    When I fill email "register@test.ru", password "123456" and confirmation "qwerty"
    Then I should see a message "Invalid email or password"