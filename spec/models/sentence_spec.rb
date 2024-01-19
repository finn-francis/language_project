# frozen_string_literal: true

require 'rails_helper'

describe Sentence do
  it { is_expected.to belong_to(:paragraph) }
  it { is_expected.to have_many(:sentence_words) }
  it { is_expected.to have_many(:words).through(:sentence_words) }
end
