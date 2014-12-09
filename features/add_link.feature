Feature: Post a link 
	As a signed in user
	I can post a new link

	@javascript

	Scenario:
		Given I am on the homepage
		And I am a signed up user
		When I click "Login"
		And I fill "test@gmail.com" as Email
		And I fill "1234567890" as Password
		And I click "Log in" button
		And I click "Submit link"
		And I fill "cuccumber testing" as Title
		And I click "Submit" button
		Then I should notice a "Current tasks:" and "Previous tasks:" sections