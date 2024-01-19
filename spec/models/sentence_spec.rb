# frozen_string_literal: true

require 'rails_helper'

describe Sentence do
  it { is_expected.to belong_to(:paragraph) }
end
