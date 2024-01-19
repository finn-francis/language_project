# frozen_string_literal: true

class Paragraph < Chapter
  belongs_to :chapter, foreign_key: :parent_id, inverse_of: :paragraphs
  has_many :sentences, dependent: :destroy, inverse_of: :paragraph
end
