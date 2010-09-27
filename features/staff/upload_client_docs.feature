@staff @documents
Feature: Upload client documents
  In order to make files available to clients
  As a staff user
  I want to be able to upload client documents

  Scenario:  Upload document
  Given I am logged in as a staff
  When I follow "Documents"
  And I follow "New"
  And I fill in "Title" with "My Title"
  And I attach the file "features/support/test.doc" to "white paper"
  And I press "Upload"
  Then I should see "Document uploaded"

  Scenario:  delete document
  Given I am logged in as a staff
  When I follow "Documents"
  And I follow "New"
  And I fill in "Title" with "My Title"
  And I attach the file "features/support/test.doc" to "white paper"
  And I press "Upload"
  And I follow "Documents"
  And I follow "Delete"
  Then I should see "Successfully destroyed document"
