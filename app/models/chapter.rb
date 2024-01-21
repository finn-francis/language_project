# frozen_string_literal: true

class Chapter < Course
  belongs_to :course, foreign_key: :parent_id, inverse_of: :chapters, optional: true
  has_many :paragraphs, dependent: :destroy, foreign_key: :parent_id, inverse_of: :chapter

  acts_as_list scope: :course
end
