@current
Feature: List users
  In order to view users
  as an admin user
  I want to be able to list registered users

  Background:
      Given the following users already exist:
      | login    | email              | password | usergroup     |
      | admin    | admin@admin.com    | password | Administrator |
      | staff    | staff@admin.com    | password | Staff         |
      | standard | standard@admin.com | password |               |

  Scenario:  Logged in with rights to view user list
    Given I am logged in as "admin" with "password"
    And I am on the admin dashboard
    When I follow "Users"
    Then I should be on the user list page

  Scenario:  Logged in without rights to view user list
    Given I am logged in as "staff" with "password"
    And I am on the admin dashboard
    Then I should not see "Users"
