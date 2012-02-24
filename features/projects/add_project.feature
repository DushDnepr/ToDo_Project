Feature: Users should have ability to manage the projects
  As a user
  I want to have ability to add projects

  Background:
    Given I am logged in

  Scenario: Projects adding with valid data
    When I add project with valid name
    Then Redirected to the list of tasks for newly created projects
    And  I should see a message "Project was successfully created."

  Scenario: Projects adding with empty name
    When I add project with empty name
    Then I should see a message "Name of project can't be blank"