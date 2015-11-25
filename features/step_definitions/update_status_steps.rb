Given(/^I'm on the profile page with email "(.*?)"$/) do |email|
  user = User.find_by_email(email)
  visit user_path(user)

end

Given(/^I should see a status text field$/) do
  expect(page).to have_css(".text_status")
end

When(/^I fill in "(.*?)"$/) do |status|
  fill_in 'status[text_status]', with: status
end

When(/^I click on the "(.*?)" button$/) do |button|
  click_on button # express the regexp above with the code you wish you had
end

Then(/^my status should be updated$/) do
  expect(page).to have_css(".timeline-item", text: "Saya Lapar")  # express the regexp above with the code you wish you had
end