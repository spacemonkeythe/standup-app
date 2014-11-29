Feature: Sign up
	As a site visitor
	I can sign up

	Scenario:
		Given I am on the homepage
		When I click "Sign up" 
		And I fill "test" as Name
		And I fill "test" as Username
		And I fill "test.gmail.com" as Email
		And I fill "test1234567890" as Password
		And I fill "test1234567890" as Password confirmation
		And I click "Join now" button
		Then I should see the link lists as a logedin
