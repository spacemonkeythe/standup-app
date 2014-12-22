Feature: Write a comment under blog post
  As a signed up and signed in site visitor
  I can post a comment under the text on the blog

  @javascript
  Scenario: I post a comment
    Given I am on the homepage
    And I am a signed up user
    And I am loged in
    And I post a standup 
    When I click on "Add comment"
    And I fill "This is a body text for a test post" as "Body"
    And I click on "Create Comment"
    Then I should notice "This is a body text for a test post" as comment 
