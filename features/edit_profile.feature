Feature: Edit profile
  As signed in user 
  I can edit my profile

  Scenario:
    Given I am a signed up user
    And I am on the homepage
    And I am loged in
    When I click "Edit profile"
    Then I should see "Edit User"

  Scenario:
    Given I am a signed up user
    And I am loged in
    And I am on the "Edit page"
    