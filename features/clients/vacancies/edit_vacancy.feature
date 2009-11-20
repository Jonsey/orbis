@vacancies @c
Feature: Ammend vacancy details
  In order to ammend or correct vacancy details
  a vacancy editor should be able to update a vacancy

  Background:
    Given the following clients already exist:
    | login   | email             | password | usergroup |
    | myself  | client@admin.com  | password | Clients   |

    And the following vacancies already exist:
    | title     | role | salary | location | duration | key_skills | role_description | client |
    | vacancy 1 | role | salary | location | duration | key skills | Role Description | myself |

    Scenario:  Client editing draft vacancy
      When I login as "myself"
      And I am on the draft vacancies page
      When I follow "edit"
      And I fill in "title" with "new title"
      And I press "Update"
      Then I should see "Vacancy updated"
      And I should be on the show vacancy page for "new title"
      And I should see "new title"

    Scenario:  Client submitting edited draft vacancy
      When I login as "myself"
      And I am on the draft vacancies page
      When I follow "edit"
      And I fill in "title" with "new title"
      And I press "Submit for approval"
      Then I should see "Vacancy updated and submitted for approval"
      And I should be on the show vacancy page for "new title"
      And I should see "new title"
