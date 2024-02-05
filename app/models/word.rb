# frozen_string_literal: true

class Word < ApplicationRecord
  FORBIDDEN_CHARACTERS = /[ ,!?()\[\]\n\r\t.]/
  REGEX = /[\p{L}\p{M}'-]+/

  attr_accessor :frequency

  belongs_to :language
  has_many :sentence_words, dependent: :destroy, inverse_of: :word
  has_many :sentences, through: :sentence_words, inverse_of: :words
  has_many :user_words, dependent: :destroy
  has_many :users, through: :user_words
end
