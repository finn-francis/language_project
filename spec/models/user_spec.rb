# frozen_string_literal: true

require 'rails_helper'

describe User do
  it { is_expected.to have_many(:user_languages).dependent(:destroy) }
  it { is_expected.to have_many(:languages) }
  it { is_expected.to have_many(:user_words).dependent(:destroy) }
  it { is_expected.to have_many(:words) }
end
