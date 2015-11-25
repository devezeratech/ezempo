FactoryGirl.define do
  factory :status do
    text_status "My Ganas Status"
    user {FactoryGirl.build(:user, id: 9999)}
  end

end
