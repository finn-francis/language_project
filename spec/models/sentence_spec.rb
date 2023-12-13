# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sentence do
  describe 'associations' do
    it { is_expected.to belong_to(:paragraph) }
  end
end
