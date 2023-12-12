# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Language do
  it { is_expected.to have_many(:words).dependent(:destroy) }
  it { is_expected.to have_many(:user_languages).dependent(:destroy) }
  it { is_expected.to have_many(:users) }

  describe 'scopes' do
    describe '#current' do
      it 'returns only languages that are linked to a user_language with the current flag set to true' do
        current_language, = create_list(:language, 2)
        create(:user_language, :current, language: current_language)

        expect(described_class.current).to contain_exactly(current_language)
      end
    end
  end
end
