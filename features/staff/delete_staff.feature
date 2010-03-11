@delete_user
Feature: Delete staff account
  In order to remove unwanted staff accounts
  As an authorized user
  I want to be able to delete a staff account

  Scenario:  Staff has no associations
   Given I am logged in as a staff
     And a staff exists with firstname: "aardvard"
   When I go to the admin staffs page
     And I follow "delete"
   Then I should see "Staff account was removed."

  Scenario: Staff has vacancies awaiting approval
   Given I am logged in as a staff
     And a staff: "John" exists with firstname: "Aardvark"
     And a vacancy exists with staff: staff "John", status: "awaiting_approval"
   When I go to the admin staffs page
     And I follow "delete"
   Then I should see "This staff member has vacancies awaiting approval.  Please re-assign the vacancies before deleting this account."


  Scenario: Staff has live vacancies
   Given I am logged in as a staff
     And a staff: "John" exists with firstname: "Aardvark"
     And a vacancy exists with staff: staff "John", status: "live"
   When I go to the admin staffs page
     And I follow "delete"
   Then I should see "This staff member has live vacancies. Please re-assign or archive the vacancies before deleting this account."


