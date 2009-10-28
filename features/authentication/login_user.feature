Feature: Login user
  In order to give authenticated users access to protected content
  As a site user
  I want to be able to login

  Scenario: User exists
    Given the following users already exist:
    | login  | email             | password | usergroup |
    | norman | normal@norman.com | password |           |
    And I am on the login page
    When I fill in "Login" with "norman"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should see "Welcome norman"
    And I should be on the my account page

