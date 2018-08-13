FactoryBot.define do
  factory :user do
    email "user@example.com"
    full_name "User Example"
    password "example1234"
    password_confirmation "example1234"

    trait :empty_email do
      email ""
    end

    trait :empty_full_name do
      email ""
    end

    trait :empty_password do
      email ""
    end

    trait :empty_password_confirmation do
      email ""
    end

  end
end
