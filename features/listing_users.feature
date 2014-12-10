Feature: Show users
  As a signed in user
  I can post se signed up users

  Scenario:
    Given I am a signed up user 
    And I am on the homepage
    And I click "Login"
    And I fill "test@gmail.com" as Email
    And I fill "1234567890" as Password
    And I click "Log in" button
    And I click "View users" button
    Then I should see "Listing users"