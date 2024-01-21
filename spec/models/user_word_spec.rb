# frozen_string_literal: true

require 'rails_helper'

describe UserWord do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:word) }
end
