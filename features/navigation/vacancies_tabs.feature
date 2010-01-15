@navigation
Feature: Display vacancy tabs
  In order to view different vacancy lists by status
  as an authorised user
  I should only see the tabs I have authorisation for

  Scenario: Logged in as client
  Given I am logged in as a client
  When I go to the admin vacancies page
  Then I should see "Drafts"
  And I should see "Awaiting approval"
  And I should see "Live"
  And I should see "Archived"

  Scenario: Logged in as a candidate
  Given I am logged in as a candidate
  When I go to the admin vacancies page
  Then I should see "Hot Vacancies"
  And I should not see "Awaiting approval"
  And I should not see "Live"
  And I should not see "Archived"
  And I should not see "Delete selected"

  Scenario: Logged in as a staff
  Given I am logged in as a staff
  When I go to the admin vacancies page
  Then I should see "Drafts"
  And I should see "Awaiting approval"
  And I should see "Live"
  And I should see "Archived"

  Scenario: Logged in as a admin
  Given I am logged in with admin rights
  When I go to the admin vacancies page
  Then I should see "Drafts"
  And I should see "Awaiting approval"
  And I should see "Live"
  And I should see "Archived"
