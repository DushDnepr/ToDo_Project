Feature: User Logout
  As User
  I want logout

  Scenario: logout user
    Given I am logged in
    When I press on link "Log out"
    Then I log out
    And I should see a message "Logged out!"