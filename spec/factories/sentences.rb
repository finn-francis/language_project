# frozen_string_literal: true

FactoryBot.define do
  factory :sentence do
    paragraph_id { 1 }
    raw_text { 'MyText' }
  end
end
