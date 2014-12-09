Given(/^I am on the homepage$/) do
  visit("/")
end

When(/^I click "(.*?)"$/) do |link|
  first(:link, link).click
end

When(/^I fill "(.*?)" as Email$/) do |email|
  fill_in "Email", :with => email
end

When(/^I fill "(.*?)" as Password$/) do |pass|
  fill_in("Password", with: pass)
end

When(/^I click "(.*?)" button$/) do |button|
	click_on button
end

Then(/^I should notice message "(.*?)"$/) do |content|
  page.should have_content(content)
end













