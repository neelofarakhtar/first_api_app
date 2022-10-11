FactoryBot.define do
  factory :user, class: 'User' do
    name { Faker::Name.name }
    mobile_number { Faker::PhoneNumber.phone_number }
  end
end