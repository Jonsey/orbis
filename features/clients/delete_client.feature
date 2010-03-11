@delete_user
Feature: Delete client
  In order to remove unwanted clients
  As an authorized user
  I want to be able to delete a client account

  Scenario:  Client has no associations
   Given I am logged in as a staff
     And a client exists
   When I go to the admin clients page
     And I follow "delete"
   Then I should see "Client account was removed."

  Scenario: Client has live vacancies
   Given I am logged in as a staff
     And a client exists
     And a vacancy exists with client: the client, status: "live"
   When I go to the admin clients page
     And I follow "delete"
   Then I should see "This client has live vacancies.  Please archive the vacancies before deleting this account."

