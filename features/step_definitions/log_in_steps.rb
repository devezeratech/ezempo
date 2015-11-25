Given(/^there is no user logged in$/) do
  delete destroy_user_session_path
end

Given(/^there is an user account with email "(.*?)", password "(.*?)" and name "(.*?)"$/) do |email, password, name|
  User.create( email: email, password: password, name: name)
end

When(/^I go to the sign in page$/) do
  visit new_user_session_path
end
When(/^I fill in "(.*)" for the (.*) in the new_user section$/) do |value, field|
  within("#new_user") do
    fill_in field, with: value
  end
end

When(/^I click the '(.*)' button$/) do |button|
  click_button button
end

Then(/^I should be signed in as "(.*?)" with "(.*?)"$/) do |name, email|
  user = User.find_by_email(email)
  visit user_path(user)
  expect(page).to have_css('.name', text: user.name)
end
