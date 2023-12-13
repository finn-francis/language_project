# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chapter do
  describe 'associations' do
    it { is_expected.to have_many(:paragraphs).dependent(:destroy) }
  end
end
