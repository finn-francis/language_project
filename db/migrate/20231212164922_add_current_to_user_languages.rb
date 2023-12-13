class AddCurrentToUserLanguages < ActiveRecord::Migration[7.1]
  def change
    add_column :user_languages, :current, :boolean, default: false
  end
end
