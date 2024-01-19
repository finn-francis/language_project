class CreateSentences < ActiveRecord::Migration[7.1]
  def change
    create_table :sentences do |t|
      t.integer :paragraph_id
      t.text :raw_text

      t.timestamps
    end
  end
end
