Feature: Show users
  As a signed in user
  I can post se signed up users

  Scenario:
    Given I am a signed up user 
    And I am on the homepage
    And I am a new, authenticated user
    And I click "View users" button
    And I click "Show"
    Then I should see "mladen"