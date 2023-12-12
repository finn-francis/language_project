# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Language do
  it { is_expected.to have_many(:words).dependent(:destroy) }
  it { is_expected.to have_many(:user_languages).dependent(:destroy) }
  it { is_expected.to have_many(:users) }
end
