FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.phone_number }
  end

  factory :exam do
    association :college
    start_time { Faker::Time.forward(days: 5, period: :morning) }
    end_time { Faker::Time.forward(days: 6, period: :morning) }
  end

  factory :exam_user do
    association :exam, factory: [:exam]
    association :user, factory: [:user]
  end

  factory :college
end
