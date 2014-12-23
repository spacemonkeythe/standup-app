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

Given(/^I post a standup$/) do
  visit '/standups/new'
  fill_in("Title", :with => "This is a title")
  first(:link, "add task").click
  fill_in("Content", :with => "This is a tasks content1")
  click_button "Submit"
  visit "/"
  click_link "This is a title"
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_on arg1
end

Then(/^I should notice "(.*?)" as comment$/) do |arg1|
  page.should have_content(arg1)
end

Then(/^I should notice "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end


