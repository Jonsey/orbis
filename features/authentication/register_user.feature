Feature:  Register a new user
  In order gain access to restricted areas
  as a new user
  I want to be able to register a new account

  Background:
  Given the following users already exist:
  | login  | email             | password     | usergroup |
  | norman | normal@norman.com | normalnorman |           |

  Scenario: enter valid registration details
    Given I am on the registration page
    And I fill in "Email" with "email@example.com"
    When I fill in "Login" with "damian"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Register"
    Then I should see "Account created"

  Scenario: login already exisits
    Given I am on the registration page
    When I fill in "Login" with "norman"
    And I fill in "Email" with "email@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Register"
    Then I should see "Login has already been taken"

  Scenario: email already exisits
    Given I am on the registration page
    When I fill in "Login" with "damian"
    And I fill in "Email" with "normal@norman.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Register"
    Then I should see "Email has already been taken"

  Scenario: password confirmation is different
    Given I am on the registration page
    When I fill in "Login" with "damian"
    And I fill in "Email" with "email@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password_diff"
    And I press "Register"
    Then I should see "Password doesn't match confirmation"
