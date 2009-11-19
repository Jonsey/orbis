@authentication
Feature: Register candidate
  As a potential candidate
  I want to be able to sign up for an account
  so that I can advertise add my cv and view special candiate features

  Scenario:  enter valid details
    Given I am on the candidate signup page
    When I fill in "Login" with "Candidate1"
    And I fill in "Firstname" with "Damian"
    And I fill in "Lastname" with "Jones"
    And I fill in "Email" with "damianajones@yahoo.co.uk"
    And I fill in "Telephone" with "01707 230230"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Register"
    Then I should see "Account created"
    And I should be on the live vacancies page

  Scenario:
    Given I am on the candidate signup page
    When I fill in "Login" with "Candidate1"
    And I press "Register"
    And I should see "errors prohibited this candidate from being saved"
