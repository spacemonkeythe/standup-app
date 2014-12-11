Feature: List all signed up users
  As a signed in user
  I can see profiles of other signed up users

  Scenario:
    Given I am a signed up user 
    And I am loged in
    When I click "View users" button
    Then I should see "Listing users"
    