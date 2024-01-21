# frozen_string_literal: true

require 'rails_helper'

describe Chapters::Ingest do
  before do
    Language.find_or_create_by(name: 'Polish')
  end

  let(:course) { create(:course) }
  let(:text) { Rails.root.join('spec/fixtures/text_samples/harry_potter_chapter_1.txt').read }

  describe '#call' do
    it 'creates the chapter, paragraphs and sentences' do
      chapter = described_class.call(build(:chapter, course: course), text)
      expect(chapter.paragraphs.count).to eq(32)
    end
  end
end
