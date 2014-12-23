Feature: Write a comment under blog post
  As a site visitor who is not signed in 
  I can not post a comment under the text on the blog

  @javascript
  Scenario: I want to post a comment but I am not signed in
    Given I am on the homepage
    And I am a signed up user
    And I am loged in
    And I post a standup
    And I log out
    When I click on "This is a title"
    Then I should not notice "Add comment"
