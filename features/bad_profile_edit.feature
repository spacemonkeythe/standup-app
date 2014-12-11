Feature: Edit profile
  As signed in user 
  I should provide required information to edit my profile

  Scenario: I did not fill out Current password field
    Given I am a signed up user
    And I am on the homepage
    And I am loged in
    When I click "Edit profile"
    And I fill "Petar" as "Name"
    And I fill "Pera" as "Username"
    And I click "Update" button
    Then I should see "Current password can't be blank"

  Scenario: I try to change current pasword with too short new one 
    Given I am a signed up user
    And I am on the homepage
    And I am loged in
    When I click "Edit profile"
    And I fill "Petar" as "Name"
    And I fill "Pera" as "Username"
    And I fill "1234" as "Password"
    And I fill "1234" as "Password confirmation"
    And I fill "1234567890" as "Current password"
    And I click "Update" button
    Then I should see "Password is too short (minimum is 8 characters)"

  Scenario: I try to edit my profile with a bad current password
    Given I am a signed up user
    And I am on the homepage
    And I am loged in
    When I click "Edit profile"
    And I fill "Petar" as "Name"
    And I fill "Pera" as "Username"
    And I fill "1234" as "Current password"
    And I click "Update" button
    Then I should see "Current password is invalid"