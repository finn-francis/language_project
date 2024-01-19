# frozen_string_literal: true

require 'rails_helper'

describe Paragraph do
  it { is_expected.to belong_to(:chapter) }
end
