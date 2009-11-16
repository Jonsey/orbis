@admin @login
Feature: User login
  As an admin user
  I want to be able to login
  So that I can carry out admin functions

  Scenario: Login in as admin
    Given an exisiting admin user with login "admin"
    When I login as "admin"
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
    Then I should be on the client draft vacancies list
    And the main menu should contain the following links:
    | name      | link                       | class  |
    | Vacancies | admin_client_vacancies_url | active |
    | Account   | edit_admin_client_url      |        |
    And the sub menu should contain the following links:
    | name | link                            | class  |
    | List | admin_candidate_vacancies_url   | active |
    | New  | new_admin_candidate_vacancy_url |        |

  Scenario: Login in as candidate
    Given I am logged in as a candidate
    Then I should be on the live vacancies list
    And the main menu should contain the following links:
    | name      | link                          | class  |
    | Vacancies | admin_candidate_vacancies_url | active |
    | Account   | edit_admin_candidate_url      |        |
    And the sub menu should contain the following links:
    | name          | link                          | class  |
    | Hot vacancies | admin_vacancies_url           | active |
    | Applied for   | admin_candidate_vacancies_url |        |


