@vacancies
Feature: List draft vacancies
  In order to manage my draft vacancies
  As a client
  I want to be able to select a draft from a list of drafts

  Background:
    Given the following clients already exist:
     | email             | password | usergroup |
     | client@admin.com  | password | Clients   |
     | other@admin.com   | password | Clients   |
     | another@admin.com | password | Clients   |

    And the following vacancies already exist:
    | role      | salary | location | role_description | client           | category   |
    | vacancy 1 | salary | location | Role Description | client@admin.com | Technology |
    | vacancy 2 | salary | location | Role Description | other@admin.com  | Technology |

  Scenario:  Client with vacancy 1 in draft
    Given I login as "client@admin.com"
    And I am on the draft vacancies page
    When I follow "edit"
    Then I should be on the edit vacancy page for "vacancy 1"

  Scenario:  Client with vacancy 2 in drafts
    Given I login as "other@admin.com"
    And I am on the draft vacancies page
    When I follow "edit"
    Then I should be on the edit vacancy page for "vacancy 2"

  Scenario:  Client with no vacancies in drafts
    Given I login as "another@admin.com"
    When I am on the draft vacancies page
    Then I should not see "edit"

  Scenario: Try to edit someone elses vacancy
    Given I login as "client@admin.com"
    And I try to go to the edit vacancy page for "vacancy 2"
    Then I should be on the home page
