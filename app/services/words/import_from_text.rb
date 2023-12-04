# frozen_string_literal: true

module Words
  class ImportFromText
    class << self
      def call(text, language)
        # Ideally we'd add this to the create loop, however as the word count for a language
        # goes up we'll end up loading hundreds of thousands of words into memory
        all_words = text.split(Word::FORBIDDEN_CHARACTERS).filter_map do |word|
          word.empty? ? nil : word.downcase
        end

        db_words = language.words.where(name: all_words).index_by(&:name)

        ActiveRecord::Base.transaction do
          all_words.each do |word|
            next if db_words[word]

            db_words[word] = Word.create(name: word, language: language)
          end
        end
      end
    end
  end
end
