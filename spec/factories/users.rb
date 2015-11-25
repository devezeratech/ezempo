FactoryGirl.define do
  factory :user do
    sequence(:name)     { |n| "someone-#{n}" }
    sequence(:email)     { |n| "someone-#{n}@ezeratech.com" }
    password  { 'heyitsme123' }
  end

end
