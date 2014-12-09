When(/^I fill "(.*?)" as Name$/) do |name|
  fill_in("Name", with: name)
end

When(/^I fill "(.*?)" as Username$/) do |username|
  fill_in("Username", with: username)
end

When(/^I fill "(.*?)" as Password confirmation$/) do |pass_confirm|
  fill_in("Password confirmation", with: pass_confirm)
end


