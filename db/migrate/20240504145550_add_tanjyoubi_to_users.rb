class AddTanjyoubiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tanjyoubi, :date, null: false
  end
end
