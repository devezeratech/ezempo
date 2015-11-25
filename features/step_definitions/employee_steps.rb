Given(/^a user exists with email "(.*?)", password "(.*?)" and name "(.*?)"$/) do |email, password, name|  
  FactoryGirl.create(:user, email: email, password: password, name: name)
end

Given(/^I signed in as "(.*?)" and password "(.*?)"$/) do |email, password|
  visit new_user_session_path
  within("#new_user") do
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Login'
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
