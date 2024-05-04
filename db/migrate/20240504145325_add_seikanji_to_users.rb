class AddSeikanjiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sei_kanji, :string, null: false
  end
end
