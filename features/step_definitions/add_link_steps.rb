When(/^I fill "(.*?)" as Title$/) do |title|
  fill_in("Title", with: title)
end

When(/^I fill "(.*?)" as Content$/) do |content|
  fill_in("Content", with: content)
end



Then(/^I should notice a "(.*?)" sections$/) do |content1|
  page.should have_content(content1)
end



