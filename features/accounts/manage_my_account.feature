@manage
Feature: Manage my acccount
  In order to change my personal details
  As an authenticated system user
  I want to be able to access and edit my personal details

  Scenario: Logged in as a staff member
    Given I am logged in as a staff
    When I follow "My Account"
    Then I should see all the common user fields

  Scenario: Logged in as a client
    Given I am logged in as a client
    When I follow "My Account"
    Then I should see all the common user fields
      And I should see "Company Name"

  Scenario: Logged in as a candidate
    Given I am logged in as a candidate
    When I follow "My Account"
    Then I should see all the common user fields

