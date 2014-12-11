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
    And I am on the homepage
    And I am loged in
    When I click "Edit profile"
    And I fill "Petar" as "Name"
    And I fill "Pera" as "Username"
    And I fill "1234567890" as "Current password"
    And I click "Update" button
    Then I should see "Your account has been updated successfully."

  Scenario:
    Given I am a signed up user
    And I am on the homepage
    And I am loged in
    When I click "Edit profile"
    And I fill "Petar" as "Name"
    And I fill "Pera" as "Username"
    And I click "Update" button
    Then I should see "Current password can't be blank"