class CreateSentenceWords < ActiveRecord::Migration[7.1]
  def change
    create_table :sentence_words do |t|
      t.integer :sentence_id
      t.integer :word_id

      t.timestamps
    end
  end
end
