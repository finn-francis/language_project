# frozen_string_literal: true

# Contains the raw text and word associations for the paragraph, chapter and course
class Sentence < ApplicationRecord
  belongs_to :paragraph, inverse_of: :sentences
  has_many :sentence_words, dependent: :destroy, inverse_of: :sentence
  has_many :words, through: :sentence_words, inverse_of: :sentences
end
