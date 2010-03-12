@create_vacancy
Feature: Staff member create a new vacancy
  In order to create vacancies for clients
  As a staff member
  I want to be able to create a new vacancy and select the client

  Background:
    Given the default categories

  Scenario: Create vacancy for existing client
   Given I am logged in as a staff
     And a client exists with company_name: "Blue Baboon", firstname: "Damian", lastname: "Jones"
     And I am on the admin vacancies page
   When I follow "New vacancy"
     And I fill out all the fields for a vacancy
     And I select "(Blue Baboon) Damian Jones" from "Client"
     And press "Create"
   Then I should see "Vacancy saved to drafts"
     When I go to the draft vacancies page
   Then I should see "Blue Baboon"
