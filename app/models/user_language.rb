# frozen_string_literal: true

class UserLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language

  validates :current, uniqueness: { scope: :user_id }, if: :current?
end
