Feature: Users should have ability to manage the listtask in project
  As a user
  I want to have ability to add listtask in project

  Background:
    Given I am logged in
    And I have a project with name "Project 1"
    And I am on page project with project name "Project 1"

  Scenario: Listtask adding with valid data
    When I add Listtask with name "Listtask 1"
    Then Redirected to the list of tasks for listtask "Listtask 1"
    And  I should see a message "Listtask was successfully created."

  Scenario: Listtask adding with empty name
    When I add listtask with empty name
    Then I should see a message "Name of listtask can't be blank"