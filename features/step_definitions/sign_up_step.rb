Given(/^I am a signed up user$/) do
  User.create!(:name => "mladen", :username => "mladenm", :email => "test@gmail.com", :password => "1234567890", :password_confirmation => "1234567890")
end

Given /^I am loged in$/ do
  visit '/users/sign_in'
  fill_in("Email", :with => "test@gmail.com")
  fill_in("Password", :with => "1234567890")
  click_button "Log in"
end
