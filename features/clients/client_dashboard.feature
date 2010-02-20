Feature: Client dash board
  In order to access all areas I am authorised to
  As a an authorised client
  I want links to all areas on one page

  Background:
    Given I am logged in as a client

    Scenario: viewing client dashboard
      And I should see "Create Vacancy"
      And I should see "Vacancies"
      And I should see "Documents"


