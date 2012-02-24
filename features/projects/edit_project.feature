@selenium
@javascript
Feature: Users should have ability to edit the projects
  As a user
  I want to have ability to edit project

  Scenario: Edit existing project with valid name
    Given I am logged in
    And I have a project with name "Project 1"
    When I change project name from "Project 1" to "Project 2"
    Then I should see a message "Project was successfully update"
    And Project "Project 2" should be exist

  Scenario: Edit existing project with empty name
    Given I am logged in
    And I have a project with name "Project 1"
    When I change project name from "Project 1" to ""
    Then I should see a message "Name of project can't be blank"
    And Project "" should not be exist