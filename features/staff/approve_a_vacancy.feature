@vacancies @cu
Feature: Approve vacancy
  In order to display vacancies on the site
  As an authorised user
  I want to be able to approve vacancies

  Scenario: Logged in as staff member
  Given I am logged in as a staff
    And a vacancy exists with status: "awaiting_approval"
  Then a vacancy should exist with status: "awaiting_approval"
  When I go to the vacancies awaiting approval page
  Then show me the page
    And I follow "edit"
    And I press "Approve"
  Then I should see "Vacancy approved"
    And a vacancy should exist with status: "Live"
