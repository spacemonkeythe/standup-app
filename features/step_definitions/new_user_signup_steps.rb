Given(/^I am a new user$/) do
	User.create({name: "mladen", username: "mladenm", email: "test@gmail.com", password: "1234567890", password_confirmation: "1234567890"})
end