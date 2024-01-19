# frozen_string_literal: true

class Sentence < Paragraph
  belongs_to :paragraph, foreign_key: :parent_id, inverse_of: :sentences
end
