Feature: Edit staff details
  In order to ammend staff details
  As an authorised user
  I want to be able to select a staff member to edit

  Scenario: Logged in as staff
    Given a staff exists with email: "staff@example.com"
    When I go to the login page
      And I fill in "Email" with "staff@example.com"
      And I fill in "Password" with "password"
      And I press "Login"
    When I go to the admin staffs page
      And I follow "edit"
      And I fill in "Firstname" with "New name"
      And I press "Update"
    Then the staff should have firstname: "New name"

