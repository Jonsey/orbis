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
  | Documents | admin_documents_url        |        |
  And the sub menu should contain the following links:
  | name           | link                            | class  |
  | List vacancies | admin_candidate_vacancies_url   | active |
  | New vacancy    | new_admin_candidate_vacancy_url |        |


