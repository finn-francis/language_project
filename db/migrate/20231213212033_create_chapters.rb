class CreateChapters < ActiveRecord::Migration[7.1]
  def change
    create_table :chapters do |t|
      t.text :raw_text
      t.string :state
      t.integer :parent_id, index: true
      t.string :type

      t.timestamps
    end
  end
end
