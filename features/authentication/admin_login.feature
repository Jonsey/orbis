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
    | name         | link                  | class  |
    | Vacancies    | admin_vacancies_url   | active |
    | Users        | admin_users_url       |        |
    | Staff        | admin_staffs_url      |        |
    | Clients      | admin_clients_url     |        |
    | Candidates   | admin_candidates_url  |        |
    | Documents    | admin_documents_url   |        |
    | Categories   | admin_categories_url  |        |
    | Applications | admin_aplications_url |        |

    And the sub menu should contain the following links:
    | name | link                  | class  |
    | List | admin_vacancies_url   | active |
    | New  | new_admin_vacancy_url |        |

  Scenario: Login in as client
    Given I am logged in as a client
    Then I should be on the new vacancy page
    And the main menu should contain the following links:
    | name      | link                | class  |
    | Vacancies | admin_vacancies_url | active |
    | Documents | admin_documents_url |        |
    And the sub menu should contain the following links:
    | name | link                  | class  |
    | List | admin_vacancies_url   | active |
    | New  | new_admin_vacancy_url |        |

  Scenario: Login in as candidate
    Given I am logged in as a candidate
    Then I should be at the live vacancies page
    And the main menu should contain the following links:
    | name         | link                   | class  |
    | Vacancies    | admin_vacancies_url    | active |
    | Applications | admin_applications_url |        |
    And the sub menu should contain the following links:
    | name | link                | class  |
    | List | admin_vacancies_url | active |

  Scenario: Login in as staff
    Given I am logged in as a staff
    Then I should be at the vacancies awaiting approval page
    And the main menu should contain the following links:
    | name       | link                 | class  |
    | Vacancies  | admin_vacancies_url  | active |
    | Candidates | admin_candidates_url |        |
    | Clients    | admin_clients_url    |        |
    | Staff      | admin_staffs_url     |        |
    And the sub menu should contain the following links:
    | name | link                | class  |
    | List | admin_vacancies_url | active |


