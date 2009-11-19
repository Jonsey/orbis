@authentication
Feature: Register client
  As a potential client
  I want to be able to sign up for an account
  so that I can advertise my vacancies

  Scenario:  enter valid details
    Given I am on the client signup page
    When I fill in "Login" with "Client1"
    And I fill in "Firstname" with "Damian"
    And I fill in "Lastname" with "Jones"
    And I fill in "Company name" with "2sCompliment"
    And I fill in "Email" with "damianajones@yahoo.co.uk"
    And I fill in "Telephone" with "01707 230230"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Register"
    Then I should see "Account created"
    And I should be on the new vacancy page page

  Scenario: invalid registration details
    Given I am on the client signup page
    When I fill in "Login" with "Client1"
    And I press "Register"
    And I should see "errors prohibited this client from being saved"
