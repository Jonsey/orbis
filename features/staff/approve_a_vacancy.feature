@vacancies @approve_vacancy
Feature: Approve vacancy
  In order to display vacancies on the site
  As an authorised user
  I want to be able to approve vacancies

  Scenario: Logged in as staff member
  Given I am logged in as a staff
    And a client exists with email: "client@example.com"
    And a vacancy exists with status: "awaiting_approval", client: the client
  Then a vacancy should exist with status: "awaiting_approval"
  When I go to the vacancies awaiting approval page
    And I follow "edit"
    And I press "Approve"
  Then I should see "Vacancy approved"
    And 1 email should be delivered to "client@example.com"
    And a vacancy should exist with status: "Live"
