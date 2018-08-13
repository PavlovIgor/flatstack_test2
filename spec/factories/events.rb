FactoryBot.define do
  factory :event do
    name "Event"
    date Date.today
    repeat :weekly

    trait :empty_name do
      name ""
    end

    trait :empty_date do
      date ""
    end

    trait :empty_repeat do
      repeat ""
    end

    trait :not_repeat do
      repeat :not_repeat
    end

    trait :weekly do
      repeat :weekly
    end

    trait :monthly do
      repeat :monthly
    end

    trait :yearly do
      repeat :yearly
    end
  end
end
