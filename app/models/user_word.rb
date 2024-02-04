# frozen_string_literal: true

class UserWord < ApplicationRecord
  STATUS_VALUES = {
    ignore: 0,
    not_learned: 1,
    recognised: 2,
    learned: 3
  }.freeze

  belongs_to :user
  belongs_to :word

  enum status: STATUS_VALUES
end
