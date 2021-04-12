FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.phone_number }

    trait :with_exam do
      association :exam_user, factory: [:exam_user]
    end
  end

  factory :exam do
    association :college
    start_time { 1.minute.from_now }
    end_time { 1.month.from_now }
  end

  factory :exam_user do
    association :exam, factory: [:exam]
    association :user, factory: [:user]
  end

  factory :college
end
