Given(/^a user exists with email "(.*?)" and name "(.*?)"$/) do |email, name|
  FactoryGirl.create(:user, email: email, name: name)
end

Given(/^I'm on the profile page with email "(.*?)"$/) do |email|
  user = User.find_by_email(email)
  visit user_path(user.to_param) # express the regexp above with the code you wish you had
end

Given(/^I should see a status box$/) do
  expect(page).to have_text(text)
end

When(/^I fill in "(.*?)" for the status in the status section$/) do |status|
  save_and_open_page
  fill_in 'text_status', with: status
end

When(/^I click on the "(.*?)" button$/) do |button_name|
  pending # express the regexp above with the code you wish you had
end

Then(/^my status should be updated$/) do
  pending # express the regexp above with the code you wish you had
end