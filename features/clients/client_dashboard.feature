Feature: Client dash board
  In order to access all areas I am authorised to
  As a an authorised client
  I want links to all areas on one page

  Background:
    Given I am logged in as a client

    Scenario: viewing client dashboard
      And I should see "New Vacancy"
      And I should see "Drafts"
      And I should see "Awaiting Approval"
      And I should see "Live"
      And I should see "Archived"
      And I should see "My Account"

