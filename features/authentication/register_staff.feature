@authentication @staff_reg
Feature: Register staff
  As a staff member
  I want to be able create new staff members
  so that they can do my work for me

  Scenario:  enter valid details
    Given I am logged in as a staff
    And I am on the staff registration page
    When I fill in "Firstname" with "Damian"
    And I fill in "Lastname" with "Jones"
    And I fill in "Email" with "staff@example.com"
    And I fill in "Telephone" with "01707 230230"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Register"
    Then I should see "Account created"
    And 1 email should be delivered to "staff@example.com"
    And I should be at the vacancies awaiting approval page

  Scenario: invalid registration details
    Given I am logged in as a staff
    And I am on the staff registration page
    When I press "Register"
    And I should see "There were problems with the following fields:"

 Scenario: Logged in as client
    Given I am logged in as a client
    When I try to go to the staff registration page
    Then I should see "You do not have permission to view this page!"


