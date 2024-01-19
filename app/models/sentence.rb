# frozen_string_literal: true

# Contains the raw text and word associations for the paragraph, chapter and course
class Sentence < ApplicationRecord
  belongs_to :paragraph, inverse_of: :sentences
end
