#@selenium
#@javascript
Feature: Users should have ability to edit the listtask
  As a user
  I want to have ability to edit listtask

  Scenario: Edit existing project with valid name
    Given I am logged in
    And I have a project with name "Project 1"
    And I have a listtask with name "Listtask 1"
    When I change listtask name from "Listtask 1" to "Listtask 2"
    Then I should see a message "Listtask was successfully update"
    And Listtask "Listtask 2" should be exist

  Scenario: Edit existing listtask with empty name
    Given I am logged in
    And I have a project with name "Project 1"
    And I have a listtask with name "Listtask 1"
    When I change listtask name from "Listtask 1" to ""
    Then I should see a message "Name of listtask can't be blank"
    And Listtask "" should not be exist