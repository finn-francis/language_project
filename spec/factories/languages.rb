# frozen_string_literal: true

FactoryBot.define do
  factory :language do
    name { Faker::Address.unique.country }
  end
end
