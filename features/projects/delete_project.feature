@selenium
@javascript
Feature: Users should have ability to delete the projects
  As a user
  I want to have ability to delete project

  Scenario: User can delete the project
    Given I am logged in
    And I have a project with name "Project 1"
    When I delete project with name "Project 1"
    Then I should see a message "Project was successfully deleted"
    And Project "Project 1" should not be exist
