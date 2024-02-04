# frozen_string_literal: true

require 'rails_helper'

describe UserWord do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:word) }
  it { is_expected.to define_enum_for(:status).with_values(UserWord::STATUS_VALUES) }
end
