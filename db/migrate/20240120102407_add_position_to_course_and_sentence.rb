class AddPositionToCourseAndSentence < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :position, :integer
    add_column :sentences, :position, :integer
  end
end
