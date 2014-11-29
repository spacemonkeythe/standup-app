Feature: Write link
	As a signed in user
	I can post a new link

	Scenario:
		Given I am on the homepage
		When I click "Login"
		And I fill "test@gmail.com" as Email
		And I fill "test1234567890" as Password
		And I click "Log in" button
		Then I should see the link lists as a logedin

