@selenium
@javascript
Feature: Users should have ability to delete the listtask
  As a user
  I want to have ability to delete listtask

  Scenario: User can delete the project
    Given I am logged in
    And I have a project with name "Project 1"
    And I have a listtask with name "Listtask 1"
    When I delete listtask with name "Listtask 1"
    Then I should see a message "Listtask was successfully deleted"
    And Listtask "Listtask 1" should not be exist