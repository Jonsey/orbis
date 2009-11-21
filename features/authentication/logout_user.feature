@current @c
Feature: Logout user
  In order to end my authenticated session
  As a site user
  I want to be able to logout

  Scenario: User logged in as client
    Given I am logged in as a client
    When I follow "Logout"
    Then I should be on the home page
    And I should see "You have been logged out"
