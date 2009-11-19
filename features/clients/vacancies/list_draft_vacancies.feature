@vacancies
Feature: List draft vacancies
  In order to manage my draft vacancies
  As a client
  I want to be able to select a draft from a list of drafts

  Background:
    Given the following clients already exist:
    | login   | email             | password | usergroup |
    | myself  | client@admin.com  | password | Clients   |
    | other   | other@admin.com   | password | Clients   |
    | another | another@admin.com | password | Clients   |

    And the following vacancies already exist:
    | title     | role | salary | location | duration | key_skills | role_description | client |
    | vacancy 1 | role | salary | location | duration | key skills | Role Description | myself |
    | vacancy 2 | role | salary | location | duration | key skills | Role Description | other  |

  Scenario:  Client with vacancy 1 in draft
    Given I login as "myself"
    And I am on the draft vacancies page
    When I follow "edit"
    Then I should be on the edit vacancy page for "vacancy 1"

  Scenario:  Client with vacancy 2 in drafts
    Given I login as "other"
    And I am on the draft vacancies page
    When I follow "edit"
    Then I should be on the edit vacancy page for "vacancy 2"

  Scenario:  Client with no vacancies in drafts
    Given I login as "another"
    When I am on the draft vacancies page
    Then I should not see "edit"

  Scenario: Try to edit someone elses vacancy
    Given I login as "myself"
    And I go to the edit vacancy page for "vacancy 2"
    Then I should be on the home page
