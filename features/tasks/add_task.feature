Feature: User should have ability to add tasks
  As User
  I want add task in task list

  Background:
    Given I am logged in
    And I have a project with name "Project 1"
    And I have a listtask with name "Listtask 1"

  Scenario: User add task in listtask with valid data
    When I add task with name "Task 1", description "Description for Task 1", state "Incomplit" and priority "1"
    Then Redirected to the list of tasks for listtask "Listtask 1"
    And  I should see a message "Task was successfully created."
