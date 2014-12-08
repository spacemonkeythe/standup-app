Feature: Show users
	As a signed in user
	I can post se signed up users

	Scenario:
		Given I am on the homepage
		When I click "Sign up" 
		And I fill "test" as Name
		And I fill "test" as Username
		And I fill "test@gmail.com" as Email
		And I fill "test1234567890" as Password
		And I fill "test1234567890" as Password confirmation
		And I click "Join now" button
		And I click "Logout"
		And I click "Login"
		And I fill "test@gmail.com" as Email
		And I fill "test1234567890" as Password
		And I click "Log in" button
		And I click "View users" button
		Then I should see "Listing users"