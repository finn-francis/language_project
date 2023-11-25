# frozen_string_literal: true

class Word < ApplicationRecord
  FORBIDDEN_CHARACTERS = /[ ,!?()\[\]\n\r\t.]/

  belongs_to :language
end
