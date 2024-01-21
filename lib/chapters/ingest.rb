# frozen_string_literal: true

module Chapters
  # Ingest the raw text for a chapter and turn it into paragraphs and sentences
  class Ingest
    class << self
      def call(chapter, raw_text)
        @instance = new(chapter, raw_text)
        @instance.call
      end
    end

    def initialize(chapter, raw_text)
      @chapter   = chapter
      @raw_text  = raw_text
      @all_words = find_chapter_words
    end

    # 1. Find or create missing words in the database
    # 2. Split the text into paragraphs
    # 3. Split the paragraphs into sentences
    # 4. Split the sentences into words
    # 5. Add missing words to the database
    # 6. Create the associations between the chapter, paragraphs, sentences and words
    def call
      @raw_text.split(Paragraph::SPLIT_REGEX).each do |paragraph_text|
        next if paragraph_text.strip.empty?

        paragraph = @chapter.paragraphs.build

        paragraph_text.split(Sentence::SPLIT_REGEX).each do |sentence_text|
          sentence = paragraph.sentences.build(raw_text: sentence_text)

          sentence_text.scan(Word::REGEX).each do |word_text|
            # TODO: We must ensure that @all_words contains evey word in the text by ensuring that
            # the text is split using the same functionality.
            sentence.words << @all_words[word_text.downcase]
          end
        end
      end

      @chapter.save!
      @chapter
    end

    private

    def find_chapter_words
      # TODO: Replace the hardcoded language with the chapter language
      ::Words::ImportFromText.call(@raw_text, Language.find_by(name: 'Polish'))
    end
  end
end
