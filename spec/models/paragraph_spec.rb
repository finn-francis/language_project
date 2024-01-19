# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Paragraph do
  describe 'associations' do
    it { is_expected.to belong_to(:chapter) }
    it { is_expected.to have_many(:sentences) }
  end
end
