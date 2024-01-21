class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.integer :parent_id, index: true
      t.string :type

      t.timestamps
    end
  end
end
