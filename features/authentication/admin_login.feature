@admin @login @current
Feature: User login
  As an admin user
  I want to be able to login
  So that I can carry out admin functions

  Scenario: Login in as admin
    Given an exisiting admin user with email "admin@example.com"
    When I login as "admin@example.com"
    Then I should be on the admin pages list
    And the main menu should contain the following links:
    | name  | link            | class  |
    | Pages | admin_pages_url | active |
    | Users | admin_users_url |        |
    And the sub menu should contain the following links:
    | name | link               | class  |
    | List | admin_pages_url    | active |
    | New  | new_admin_page_url |        |

  Scenario: Login in as client
    Given I am logged in as a client
    Then I should be on the new vacancy page
    And the main menu should contain the following links:
    | name      | link                  | class  |
    | Vacancies | admin_vacancies_url   | active |
    | Account   | edit_admin_client_url |        |
    And the sub menu should contain the following links:
    | name | link                  | class  |
    | List | admin_vacancies_url   | active |
    | New  | new_admin_vacancy_url |        |

  Scenario: Login in as candidate
    Given I am logged in as a candidate
    Then I should be at the live vacancies page
    And the main menu should contain the following links:
    | name      | link                     | class  |
    | Vacancies | admin_vacancies_url      | active |
    | Account   | edit_admin_candidate_url |        |
    And the sub menu should contain the following links:
    | name | link                | class  |
    | List | admin_vacancies_url | active |

  Scenario: Login in as staff
    Given I am logged in as a staff
    Then I should be at the vacancies awaiting approval page
    And the main menu should contain the following links:
    | name       | link                 | class  |
    | Vacancies  | admin_vacancies_url  | active |
    | Account    | admin_staff_url      |        |
    | Candidates | admin_candidates_url |        |
    | Clients    | admin_clients_url    |        |
    And the sub menu should contain the following links:
    | name | link                | class  |
    | List | admin_vacancies_url | active |


