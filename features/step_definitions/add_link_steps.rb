Then(/^I should notice a "(.*?)" sections$/) do |content1|
  page.should have_content(content1)
end