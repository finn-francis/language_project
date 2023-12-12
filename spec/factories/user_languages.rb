# frozen_string_literal: true

FactoryBot.define do
  factory :user_language do
    language
    user

    trait :current do
      current { true }
    end
  end
end
