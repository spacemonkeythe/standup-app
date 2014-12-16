Then(/^I should notice a "(.*?)" sections$/) do |content1|
  page.find('h2', :text => "Current tasks:").text(content1)
end
