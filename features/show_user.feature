Feature: Show user
  As a signed in user
  I can visit my profile

  Scenario:
    Given I am a signed up user 
    And I am on the homepage
    And I am loged in
    When I click "View users" button
    And I click "Show"
    Then I should see "mladen"
    