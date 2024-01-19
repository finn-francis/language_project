# frozen_string_literal: true

# Top level container model to contain learning materials
class Course < ApplicationRecord
  has_many :chapters, dependent: :destroy, foreign_key: :parent_id, inverse_of: :course
end
