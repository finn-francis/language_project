# frozen_string_literal: true

require 'rails_helper'

describe SentenceWord do
  it { is_expected.to belong_to(:sentence) }
  it { is_expected.to belong_to(:word) }
end
