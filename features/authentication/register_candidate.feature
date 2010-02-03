@authentication
Feature: Register candidate
  As a potential candidate
  I want to be able to sign up for an account
  so that I can advertise add my cv and view special candiate features

  Scenario:  enter valid details without cv
    Given I am on the candidate signup page
    When I fill in "First name" with "Damian"
    And I fill in "Last name" with "Jones"
    And I fill in "Email" with "damianajones@yahoo.co.uk"
    And I fill in "Telephone" with "01707 230230"
    And I fill in "Password" with "password"
    And I fill in "Confirm password" with "password"
    And I press "Create Account"
    Then I should see "Account created"
    And I should be at the live vacancies page

  Scenario:  enter valid details with cv
    Given I am on the candidate signup page
    When I fill in "First name" with "Damian"
     And I fill in "Last name" with "Jones"
     And I fill in "Email" with "damianajones@yahoo.co.uk"
     And I fill in "Telephone" with "01707 230230"
     And I fill in "Password" with "password"
     And I fill in "Confirm password" with "password"
     And I attach the file "features/support/test.doc" to "Your CV"
     And I press "Create Account"
    Then I should see "Account created"
     And I should see "cv uploaded successfuly"
     And I should be at the live vacancies page

  Scenario:
    Given I am on the candidate signup page
    When I press "Create Account"
    And I should see "Please fill in all the required fields."
