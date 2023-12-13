# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserLanguage do
  subject { create(:user_language) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:language) }
  it { is_expected.to validate_uniqueness_of(:current).scoped_to(:user_id) }
end
