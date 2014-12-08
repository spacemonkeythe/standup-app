When(/^I fill "(.*?)" as Name$/) do |arg1|
	fill_in("Name", with: arg1)
end

When(/^I fill "(.*?)" as Username$/) do |arg1|
  fill_in("Username", with: arg1)
end

When(/^I fill "(.*?)" as Password confirmation$/) do |arg1|
  fill_in("Password confirmation", with: arg1)
end


