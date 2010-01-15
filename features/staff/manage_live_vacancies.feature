@manage_vacancies
Feature: Manage live vacancies
  In order to manage live vacancies
  as a staff member
  I want to be able to edit and archive live vacancies

  Scenario: Edit a live vacancy as a staff member
    Given I am logged in as a staff
      And I have one vacancy with status "live"
    When I go to the live vacancies page
      And I follow "Edit"
      And I fill in "Salary" with "40,000"
      And I press "Update"
    Then I should see "Vacancy updated"

  Scenario: Edit a live vacancy as a client
    Given I am logged in as a client
      And I have one vacancy with status "live"
    When I go to the live vacancies page
    Then I should not see "Edit"

  Scenario: Edit a live vacancy as a candidate
    Given I am logged in as a candidate
      And I have one vacancy with status "live"
    When I go to the live vacancies page
    Then I should not see "Edit"

  Scenario: Archive a live vacancy as a staff member
    Given I am logged in as a staff
      And I have one vacancy with status "live"
    When I go to the live vacancies page
      And I follow "Edit"
      And I press "Archive"
    Then I should see "Vacancy archived"
      And I should have 1 vacancy with status "archived"


