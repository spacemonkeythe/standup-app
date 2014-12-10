Feature: Bad signup
  As a new user
  I must 

  Scenario:
    Given I am on the homepage
    When I click "Sign up" 
    And I fill "test" as Username
    And I fill "test1234567890" as Password
    And I fill "test1234567890" as Password confirmation
    And I click "Join now" button
    Then I should see  "Email can't be blank"

  Scenario:
    Given I am on the homepage
    And I am a signed up user
    When I click "Sign up" 
    And I fill "test" as Username
    And I fill "test@gmail.com" as Email
    And I fill "test1234567890" as Password confirmation
    And I click "Join now" button
    Then I should see  "Email has already been taken"

  Scenario:
    Given I am on the homepage
    When I click "Sign up" 
    And I fill "test" as Username
    And I fill "test@gmail.com" as Email
    And I fill "test1234567890" as Password confirmation
    And I click "Join now" button
    Then I should see "Password can't be blank Name Username Email Password (8 characters minimum)"

  Scenario:
    Given I am on the homepage
    When I click "Sign up" 
    And I fill "test" as Username
    And I fill "test@gmail.com" as Email
    And I fill "test1234567890" as Password
    And I click "Join now" button
    Then I should not see "Join now"