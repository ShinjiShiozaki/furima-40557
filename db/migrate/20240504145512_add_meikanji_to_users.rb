class AddMeikanjiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mei_kanji, :string, null: false
  end
end
