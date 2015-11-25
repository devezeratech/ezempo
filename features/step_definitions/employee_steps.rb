Given(/^a user exists with email "(.*?)" and password "(.*?)"$/) do |email, password|
  User.create( email: email, password: password)
end

Given(/^I signed in as "(.*?)" and password "(.*?)"$/) do |email, password|
  visit new_user_session_path
  within("#new_user") do
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end

Given(/^I'm on the dashboard page$/) do
  visit root_path
end

When(/^I click on "(.*?)" link with email "(.*?)"$/) do |link_name, email|
  user = User.find_by_email(email)
  visit user_path(user.to_param)
end

Then(/^I should be able to see my profile with email "(.*?)"$/) do |email|
  user = User.find_by_email(email)
  visit user_path(user.to_param)
end

Given(/^there is no user logged in$/) do
  delete destroy_user_session_path
end

Given(/^there is a user account with email "(.*?)" and password "(.*?)"$/) do |email, password|
  User.create( email: email, password: password)
end

When(/^I go to the sign in page$/) do
  visit new_user_session_path
end

When(/^I fill in "(.*)" for the (.*) in the new_user section$/) do |value, field|
  within("#new_user") do
    fill_in field, with: value
  end
end

# When(/^I fill in "(.*?)" for the password in the new_employee section$/) do |password|
#   @user = User.create!(password: "heyitsme123")  
#   visit new_user_session_path
#   within("#new_employee") do
#     fill_in 'Password', with: "heyitsme123"
#   end
# end

When(/^I click the '(.*)' button$/) do |button|
  click_button button
end

Then(/^I should be signed in as "(.*?)"$/) do |email|
  expect(page).to have_css('.username', text: email)
end