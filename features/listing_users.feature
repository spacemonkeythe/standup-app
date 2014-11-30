Feature: Show users
	As a signed in user
	I can post se signed up users

	Scenario:
		Given I am on the homepage
		When I click "Login"
		And I fill "asdf@gmail.com" as Email
		And I fill "asdfasdf" as Password
		And I click "Log in" button
		And I click "View users" button
		Then I should see "Listing users"