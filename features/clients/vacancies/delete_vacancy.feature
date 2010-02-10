@vacancies
Feature: Delete a vacancy
  In order to remove vacancies from my drafts or archived lists
  As an authorised client
  I want to be able to delete vacancies

  Background:
    Given I am logged in as a client

  Scenario: Delete draft vacancy
    Given a vacancy exists with status: "draft", client_id: current_user.id
      And I am on the draft vacancies page
    Then a vacancy should exist with status: "draft"
    When I follow "delete"
    Then I should see "Vacancy deleted"

  Scenario: Try to delete a vacancy awaiting approval
    Given a vacancy exists with status: "awaiting approval"
      And I am on the vacancies awaiting approval page
    Then I should not see "delete"

  Scenario: Try to delete a live vacancy
    Given a vacancy exists with status: "live"
      And I am on the live vacancies page
    Then I should not see "delete"

  Scenario: Try to delete an archived vacancy
    Given a vacancy exists with status: "archived"
      And I am on the archived vacancies page
    When I follow "delete"
    Then I should see "Vacancy deleted"
