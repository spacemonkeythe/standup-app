Given(/^I am on the homepage$/) do
  visit("/")
end

When(/^I click "(.*?)"$/) do |arg1|
	first(:link, arg1).click
end


When(/^I fill "(.*?)" as Email$/) do |arg1|
  fill_in "Email", :with => arg1
end

When(/^I fill "(.*?)" as Password$/) do |arg1|
  fill_in("Password", with: arg1)
end

When(/^I click "(.*?)" button$/) do |arg1|
	click_on arg1
end

Then(/^I should notice message "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end













