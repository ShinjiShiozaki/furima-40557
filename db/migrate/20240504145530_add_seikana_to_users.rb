class AddSeikanaToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sei_kana, :string, null: false
  end
end
