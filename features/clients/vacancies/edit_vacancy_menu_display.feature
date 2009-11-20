@vacancies
Feature: Menu display when editing a vacancy
In order to access other areas of the site
vacancy editor will need the correct menu to be rendered

  Background:
    Given the following clients already exist:
    | login   | email             | password | usergroup |
    | myself  | client@admin.com  | password | Clients   |

    And the following vacancies already exist:
    | title     | role | salary | location | duration | key_skills | role_description | client |
    | vacancy 1 | role | salary | location | duration | key skills | Role Description | myself |

Scenario: Client editing vacancy
  When I login as "myself"
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


