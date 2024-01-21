# frozen_string_literal: true

# Top level container model to contain learning materials
class Course < ApplicationRecord
  # TODO(Finn):
  # 1. Scope course to user
  # 2. Scope course to a language
  has_many :chapters, dependent: :destroy, foreign_key: :parent_id, inverse_of: :course

  acts_as_list
end
