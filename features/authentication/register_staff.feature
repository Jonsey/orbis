@authentication @c
Feature: Register staff
  As a staff member
  I want to be able create new staff members
  so that they can do my work for me

  Scenario:  enter valid details
    Given I am logged in as a staff
    And I am on the staff registration page
    When I fill in "Login" with "Staff1"
    And I fill in "Firstname" with "Damian"
    And I fill in "Lastname" with "Jones"
    And I fill in "Email" with "damianajones@yahoo.co.uk"
    And I fill in "Telephone" with "01707 230230"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Register"
    Then I should see "Account created"
    And I should be at the vacancies awaiting approval page

  Scenario: invalid registration details
    Given I am logged in as a staff
    And I am on the staff registration page
    When I fill in "Login" with "Staff1"
    And I press "Register"
    And I should see "errors prohibited this staff from being saved"

