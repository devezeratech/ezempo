Given(/^I'm on the User Profile page with email "(.*?)"$/) do |email|
  user = User.find_by_email(email)
  visit user_path(user)
end

Given(/^my position is "(.*?)" with email "(.*?)"$/) do |old_position, email|
  user = User.find_by_email(email)
  user.position = old_position
  user.save!
end

Given(/^I click on "(.*?)" link$/) do |link|
  click_on link
end

When(/^I fill in new position "(.*?)"$/) do |new_position|
  fill_in "user[position]", with: new_position
end

When(/^I click on "(.*?)" button$/) do |button|
  click_on button # express the regexp above with the code you wish you had
end

Then(/^I should be able to update my position from "(.*?)" to "(.*?)" with email "(.*?)"$/) do |old_position, new_position, email|
  user = User.find_by_email(email)
  visit user_path(user)
  expect(page).to have_css('.user-position', text: new_position)
end
