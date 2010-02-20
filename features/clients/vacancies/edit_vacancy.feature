@vacancies
Feature: Ammend vacancy details
  In order to ammend or correct vacancy details
  a vacancy editor should be able to update a vacancy

  Background:
    Given the following clients already exist:
    | email            | password | usergroup |
    | client@admin.com | password | Clients   |

    And the following vacancies already exist:
    | role      | salary | location | role_description | client           |
    | vacancy 1 | salary | location | Role Description | client@admin.com |

    Scenario:  Client editing draft vacancy
      When I login as "client@admin.com"
      And I am on the draft vacancies page
      When I follow "edit"
      And I fill in "role" with "new role"
      And I press "Update"
      Then I should see "Vacancy updated"
      And I should be on the show vacancy page for "new role"
      And I should see "new role"

    Scenario:  Client submitting edited draft vacancy
      When I login as "client@admin.com"
      And I am on the draft vacancies page
      When I follow "edit"
      And I fill in "role" with "new role"
      And I press "Submit for approval"
      Then I should see "Vacancy updated and submitted for approval"
      And I should be on the show vacancy page for "new role"
      And I should see "new role"
