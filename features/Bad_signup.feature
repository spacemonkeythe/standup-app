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