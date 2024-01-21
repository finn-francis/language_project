# frozen_string_literal: true

FactoryBot.define do
  factory :chapter do
    course
    name { Faker::Lorem.word }
  end
end
