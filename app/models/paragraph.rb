# frozen_string_literal: true

class Paragraph < Chapter
  belongs_to :chapter, foreign_key: :parent_id, inverse_of: :paragraphs
end
