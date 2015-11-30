Given(/^there is an user signed in with email "(.*?)", password "(.*?)" and name "(.*?)"$/) do |email, password, name|
  FactoryGirl.create(:user, email: email, password: password, name: name)
end

When(/^I fill in "(.*?)" to "(.*?)"$/) do |value, field_name|
  fill_in field_name, with: value
end

When(/^click on the "(.*?)" (?:button|link)$/) do |button_name|
  click_on button_name
end

When(/^I click on the "(.*?)" element$/) do |element_id|
  page.execute_script("$('##{element_id}').click()");
end

Then(/^the last message in the chatbox should display name "(.*?)" and chat "(.*?)"$/) do |name, message|
  user = User.find_by_name(name)
  message = Chat.where(user: user)
  within all('#chat-output').last do
    find('.name').set user.name
    find('.body').set message
  end
end
