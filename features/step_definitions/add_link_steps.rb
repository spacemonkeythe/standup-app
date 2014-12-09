Given /^I wait for (\d+) seconds?$/ do |n|
  sleep(n.to_i)
end

When(/^I fill "(.*?)" as Title$/) do |arg1|
  fill_in("Title", with: arg1)
end

When(/^I fill "(.*?)" as Content$/) do |arg1|
  fill_in("Content", with: arg1)
end



Then(/^I should notice a "(.*?)" and "(.*?)" sections$/) do |arg1, arg2|
  page.should have_content(arg1)
  page.should have_content(arg2)
end



