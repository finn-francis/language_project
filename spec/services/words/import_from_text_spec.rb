# frozen_string_literal: true

require 'rails_helper'

describe Words::ImportFromText do
  context 'with a large, valid block of text containing known and new words' do
    let(:text) { Rails.root.join('spec/fixtures/text_samples/polish_sample.txt').read }
    let(:polish) { Language.find_or_create_by(name: 'Polish') }

    it 'creates database entries for the new words' do
      expect { described_class.call(text, polish) }.to change(Word, :count).by(345)
    end
  end
end
