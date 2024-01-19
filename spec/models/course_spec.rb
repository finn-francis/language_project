# frozen_string_literal: true

require 'rails_helper'

describe Course do
  it { is_expected.to have_many(:chapters) }
end
