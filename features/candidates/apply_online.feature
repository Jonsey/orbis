@candidates @apply_for_role
Feature: apply online
 In order to quickly apply for a job
 As a candidate
 I want to be able to apply for the job quickly and easily

 Background:
   Given a staff exists with email: "staff@example.com"
     And a vacancy exists with role: "New vacancy", status: "live", staff: the staff

 Scenario: Candidate is logged in
    And I am logged in as a candidate
   When I go to the vacancy's page
    And I press "Apply for this role"
   Then I should see "Staff have been notified of your application. You can view your current applications from the control panel"
    And an application should exist with candidate: the candidate, vacancy: the vacancy
    And an email "New vacancy application" should be delivered to the "staff@example.com"


 Scenario: Candidate is not logged in
   Given a candidate exists with email: "candidate@example.com"
   And I am on the vacancy's page
   When I follow "Apply for this role"
   Then I should be on the candidate login page
   When I fill in "Email" with "candidate@example.com"
    And I fill in "Password" with "password"
    And I press "Login"
   Then I should be on the vacancy's page
   When I press "Apply for this role"
   Then I should see "Staff have been notified of your application. You can view your current applications from the control panel"
    And an application should exist with candidate: the candidate, vacancy: the vacancy
    And an email "New vacancy application" should be delivered to the "staff@example.com"
