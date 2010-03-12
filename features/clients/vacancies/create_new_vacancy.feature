@vacancies @new
Feature: Create new vacancy
  In order to advertise vacancies on the web site
  As a client
  I want to be able to create new vacancies

  Background:
    Given I am logged in as a client

  Scenario:  Fill out all the fields
    Given the default categories
    When I go to the new vacancy page
    Then I should not see "Client:"
    When I fill out all the fields for a vacancy
     And I press "Create"
    Then I should see "Vacancy saved to drafts"
