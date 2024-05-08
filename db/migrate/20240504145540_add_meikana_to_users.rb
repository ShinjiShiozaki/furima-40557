class AddMeikanaToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mei_kana, :string, null: false
  end
end
