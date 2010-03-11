@delete_user
Feature: Delete candidate
  In order to remove unwanted candidates
  As an authorized user
  I want to be able to delete a candidate account

  Scenario:  Candidate has no associations
   Given I am logged in as a staff
     And a candidate exists
   When I go to the admin candidates page
     And I follow "delete"
   Then I should see "Candidate account was removed."

