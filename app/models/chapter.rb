# frozen_string_literal: true

class Chapter < ApplicationRecord
  has_many :paragraphs, foreign_key: :parent_id, inverse_of: :chapter, dependent: :destroy
end
