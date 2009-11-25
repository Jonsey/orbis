@vacancies @cu
Feature: Approve vacancy
  In order to display vacancies on the site
  As an authorised user
  I want to be able to approve vacancies

  Scenario: Logged in as staff member
  Given I am logged in as a staff
  And I have one vacancy with status "awaiting approval"
  When I go to the vacancies awaiting approval page
  And I follow "edit"
  And I press "Approve"
  Then I should see "Vacancy approved"
  And I should have 1 vacancy with status "Live"
