# frozen_string_literal: true

class UserWord < ApplicationRecord
  belongs_to :user
  belongs_to :word
end
