@myaccount
Feature: Edit my account
  In order to ammend my personal details
  As a candidate
  I want to be able to change my details and save them

  Scenario: Update candidate details
    Given I am logged in as a candidate
    When I go to my candidate account page
      And I fill in "First name" with "New name"
      And I press "Update"
    Then I should see "Editing: New name"

  Scenario: Update staff details
    Given I am logged in as a staff
    When I go to my staff account page
      And I fill in "First name" with "New name"
      And I press "Update"
    Then I should see "Editing: New name"

  Scenario: Update client details
    Given I am logged in as a client
    When I go to my client account page
      And I fill in "First name" with "New name"
      And I press "Update"
    Then I should see "Editing: (Space tech) New name Jones"
