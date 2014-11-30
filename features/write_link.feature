Feature: Sign in
	As a signed up user 
	I can sign in 

	Scenario:
		Given I am on the homepage
		When I click "Login"
		And I fill "asdf@gmail.com" as Email
		And I fill "asdfasdf" as Password
		And I click "Log in" button
		Then I should notice message "Signed in successfully."

