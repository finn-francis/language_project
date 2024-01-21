# frozen_string_literal: true

class SentenceWord < ApplicationRecord
  belongs_to :sentence, inverse_of: :sentence_words
  belongs_to :word, inverse_of: :sentence_words
end
