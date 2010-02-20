@authentication
Feature: Register client
  As a potential client
  I want to be able to sign up for an account
  so that I can advertise my vacancies

  Scenario:  Enter valid details
    Given I am on the client signup page
    When I fill in "First name" with "Damian"
    And I fill in "Last name" with "Jones"
    And I fill in "Company name" with "2sCompliment"
    And I fill in "Email" with "damianajones@yahoo.co.uk"
    And I fill in "Telephone" with "01707 230230"
    And I fill in "Password" with "password"
    And I fill in "Confirm password" with "password"
    And I press "Create account"
    Then I should see "Account created"
    And I should be on the new vacancy page page

  Scenario: Invalid registration details
    Given I am on the client signup page
    When I press "Create account"
    And I should see "There were problems with the following fields:"
