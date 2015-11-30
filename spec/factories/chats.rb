FactoryGirl.define do
  factory :chat do
    user { FactoryGirl.build(:user)}
message "MyString"
  end

end
