# frozen_string_literal: true

class Language < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :user_languages, dependent: :destroy
  has_many :users, through: :user_languages
end
