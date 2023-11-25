# frozen_string_literal: true

module Words
  class ImportFromText
    class << self
      def call(text, language)
        all_words = text.split(Word::FORBIDDEN_CHARACTERS)
        all_words = all_words.reject(&:empty?)
        all_words = all_words.map(&:downcase)

        all_words.each do |word|
          db_record = language.words.find_by(name: word)
          next if db_record

          language.words.create(name: word)
        end
      end
    end
  end
end