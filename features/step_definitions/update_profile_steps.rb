Given(/^a user exists with email "(.*?)" and name "(.*?)" and contact_number "(.*?)"$/) do |email, name, contact_number|
 FactoryGirl.create(:user, email: email, name: name, contact_number: contact_number)
end

Then(/^I should be able to update my contact_number from "(.*?)" to "(.*?)"$/) do |old_contact_number, new_contact_number|
  @user = User.create(contact_number: old_contact_number, name: "employee")
  @user.contact_number = new_contact_number
  @user.save # express the regexp above with the code you wish you had
end