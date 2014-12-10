Feature: Show users
  As a signed in user
  I can post se signed up users

  Scenario:
    Given I am a signed up user 
    And I am loged in
    When I click "View users" button
    Then I should see "Listing users"
    