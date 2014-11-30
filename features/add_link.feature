Feature: Post a link 
	As a signed in user
	I can post a new link

	Scenario, js: true do
		Given I am on the homepage
		When I click "Login"
		And I fill "asdf@gmail.com" as Email
		And I fill "asdfasdf" as Password
		And I click "Log in" button
		And I click "Submit link"
		And I fill "cuccumber testing" as Title
		And I click "add task"
		And I fill "cucumber testing task 1" as Content
		And I click "Submit"
		Then I should notice a "Current tasks:" and "Before tasks" sections