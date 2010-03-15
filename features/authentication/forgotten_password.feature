@reset_my_password
Feature: Reset my password when I have forgotten it
  In order to access my account when I have forgotten my password
  As a user with a valid account
  I want to be able to request to reset my password

  Scenario: Candidate account exists
   Given a candidate exists with email: "user@example.com"
   When I go to the new password_reset page
     And I fill in "Email:" with "user@example.com"
     And I press "Reset my password"
   Then a "password_reset" notification should be delivered to "user@example.com"
     And I should see "Instructions to reset your password have been emailed to you. Please check your email."
