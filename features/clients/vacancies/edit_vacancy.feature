@vacancies
Feature: Ammend vacancy details
  In order to ammend or correct vacancy details
  a vacancy editor should be able to update a vacancy

    Scenario:  Client editing draft vacancy
     Given a client exists with email: "client@admin.com", password: "password"
      And a vacancy exists with client: the client
      When I login as "client@admin.com"
      And I go to the draft vacancies page
      When I follow "edit"
      And I fill in "role" with "new role"
      And I press "Update"
      Then I should see "Vacancy updated"
      And I should be on the show vacancy page for "new role"
      And I should see "new role"

    Scenario:  Client submitting edited draft vacancy
     Given a client exists with email: "client@admin.com", password: "password"
      And a vacancy exists with client: the client
      When I login as "client@admin.com"
      And I go to the draft vacancies page
      When I follow "edit"
      And I fill in "role" with "new role"
      And I press "Submit for approval"
      Then I should see "Vacancy updated and submitted for approval"
      And I should be on the show vacancy page for "new role"
      And I should see "new role"
