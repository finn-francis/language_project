# frozen_string_literal: true

class Language < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :user_languages, dependent: :destroy
  has_many :users, through: :user_languages

  scope :current, -> { joins(:user_languages).where(user_languages: { current: true }) }
end
