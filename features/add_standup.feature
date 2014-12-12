Feature: Post a standup
  As a signed in user
  I can post a new standup

  @javascript
  Scenario:
    Given I am on the homepage
    And I am a signed up user
    And I am loged in
    When I click "Submit standup"
    And I fill "cuccumber testing" as "Title"
    And I click "add task"
    And I fill "cucumber testing task 1" as "Content"
    And I click "Submit" button
    Then I should notice a "cucumber testing task 1" sections
    