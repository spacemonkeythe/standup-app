Feature: Bad login
  As a signed in user
    I can post se signed up users

  Scenario:
    Given I am a signed up user 
    And I am on the homepage
    When I click "Login"
    And I fill "testt@gmail.com" as Email
    And I fill "1234567890" as Password
    And I click "Log in" button
    Then I should see "Invalid email or password."

  Scenario:
    Given I am a signed up user 
    And I am on the homepage
    When I click "Login"
    And I fill "test@gmail.com" as Email
    And I fill "12345678901" as Password
    And I click "Log in" button
    Then I should see "Invalid email or password."