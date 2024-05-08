class AddNicknameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nick_name, :string, null: false
  end
end
