
Given(/^I am a signed up user$/) do
  User.create({email: "test@gmail.com" , password: "1234567890"})
end