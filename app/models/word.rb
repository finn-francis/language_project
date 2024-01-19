# frozen_string_literal: true

class Word < ApplicationRecord
  FORBIDDEN_CHARACTERS = /[ ,!?()\[\]\n\r\t.]/

  belongs_to :language
  has_many :sentence_words, dependent: :destroy, inverse_of: :word
  has_many :sentences, through: :sentence_words, inverse_of: :words
end
