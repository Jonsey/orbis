@vacancies
Feature: Delete a vacancy
  In order to remove vacancies from my drafts or archived lists
  As an authorised client
  I want to be able to delete vacancies

  Background:
    Given I am logged in as a client

  Scenario: Delete draft vacancy
    Given I have one vacancy with status "draft"
      And I am on the draft vacancies page
    When I follow "delete"
    Then I should see "Vacancy deleted"

  Scenario: Try to delete a vacancy awaiting approval
    Given I have one vacancy with status "awaiting approval"
      And I am on the vacancies awaiting approval page
    Then I should not see "delete"

  Scenario: Try to delete a live vacancy
    Given I have one vacancy with status "live"
      And I am on the live vacancies page
    Then I should not see "delete"

  Scenario: Try to delete an archived vacancy
    Given I have one vacancy with status "archived"
      And I am on the archived vacancies page
    When I follow "delete"
    Then I should see "Vacancy deleted"
