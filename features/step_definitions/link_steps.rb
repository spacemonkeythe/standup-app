Given(/^I am on the homepage$/) do
  visit("/")
end

When(/^I click "(.*?)"$/) do |link|
  first(:link, link).click
end

When(/^I click "(.*?)" button$/) do |button|
  click_on button
end

Then(/^I should notice message "(.*?)"$/) do |content|
  page.should have_content(content)
end