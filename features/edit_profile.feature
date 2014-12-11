Feature: Edit profile
  As signed in user 
  I can edit my profile

  Scenario: I visit edit page for my profile
    Given I am a signed up user
    And I am on the homepage
    And I am loged in
    When I click "Edit profile"
    Then I should see "Edit User"

  Scenario: I edit my name
    Given I am a signed up user
    And I am on the homepage
    And I am loged in
    When I click "Edit profile"
    And I fill "Petar" as "Name"
    And I fill "1234567890" as "Current password"
    And I click "Update" button
    Then I should see "Your account has been updated successfully."

  Scenario: I edit my username
    Given I am a signed up user
    And I am on the homepage
    And I am loged in
    When I click "Edit profile"
    And I fill "Pera" as "Username"
    And I fill "1234567890" as "Current password"
    And I click "Update" button
    Then I should see "Your account has been updated successfully."

  Scenario: I edit my password
    Given I am a signed up user
    And I am on the homepage
    And I am loged in
    When I click "Edit profile"
    And I fill "0987654321" as "Password"
    And I fill "0987654321" as "Password confirmation"
    And I fill "1234567890" as "Current password"
    And I click "Update" button
    Then I should see "Your account has been updated successfully."

  @javascript
  Scenario: I want to delete my account
    Given I am a signed up user
    And I am on the homepage
    And I am loged in
    When I click "Edit profile"
    And I fill "1234567890" as "Current password"
    And I click "Cancel my account" button
    And I accept the confirmation
    Then I should see "Bye! Your account has been successfully cancelled. We hope to see you again soon."
