When(/^I fill "(.*?)" as "(.*?)"$/) do |content, field|
  fill_in(field, with: content)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

When(/^I accept the confirmation$/) do
  page.driver.browser.switch_to.alert.accept
end
