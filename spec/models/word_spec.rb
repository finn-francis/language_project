# frozen_string_literal: true

require 'rails_helper'

describe Word do
  it { is_expected.to belong_to(:language) }
  it { is_expected.to have_many(:sentence_words) }
  it { is_expected.to have_many(:sentences).through(:sentence_words) }
  it { is_expected.to have_many(:user_words).dependent(:destroy) }
  it { is_expected.to have_many(:users) }
end
