@pickle @candidates
Feature: apply online
 In order to quickly apply for a job
 As a candidate
 I want to be able to apply for the job quickly and easily

 Background:
  Given a vacancy exists with role: "New vacancy", status: "live"

 Scenario: Candidate is not logged in
    And I am logged in as a candidate
   When I go to the vacancy's page
    And I follow "Apply for this role"
   Then I should see "Staff have been notified of your application, you can view your current applications from the control panel"
    And 1 application should exist with candidate: the candidate, vacancy: the vacancy


 Scenario: Candidate is logged in
   And I am on the vacancy's page
   When I follow "Apply for this role"
   Then I should be on the candidate login page
   When I fill in "Email" with "me@example.com"
    And I fill in "Password" with "password"
    And I press "Login"
   Then I should be on the vacancy's page
