class CreateWords < ActiveRecord::Migration[7.1]
  def change
    create_table :words do |t|
      t.string :name
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
    add_index :words, :name
  end
end
