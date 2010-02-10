@vacancies
Feature: Menu display when editing a vacancy
In order to access other areas of the site
vacancy editor will need the correct menu to be rendered

  Background:
    Given the following clients already exist:
    | email            | password | usergroup |
    | client@admin.com | password | Clients   |

    And the following vacancies already exist:
    | role      | salary | location | role_description | client           | category   |
    | vacancy 1 | salary | location | Role Description | client@admin.com | Technology |

Scenario: Client editing vacancy
  When I login as "client@admin.com"
  And I am on the draft vacancies page
  When I follow "edit"
  Then the main menu should contain the following links:
  | name      | link                       | class  |
  | Vacancies | admin_client_vacancies_url | active |
  | Account   | edit_admin_client_url      |        |
  And the sub menu should contain the following links:
  | name | link                            | class  |
  | List | admin_candidate_vacancies_url   | active |
  | New  | new_admin_candidate_vacancy_url |        |


