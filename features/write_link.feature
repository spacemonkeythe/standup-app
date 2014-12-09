Feature: Sign in
	As a signed up user 
	I can sign in 

	Scenario:
		Given I am a signed up user
		And I am on the homepage
		When I click "Login"
		And I fill "test@gmail.com" as Email
		And I fill "1234567890" as Password
		And I click "Log in" button
		Then I should notice message "Signed in successfully."

