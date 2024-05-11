class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :mei,                  null: false
      t.text :setsumei,               null: false
      t.integer :category_id,         null: false
      t.integer :jyoutai_id,          null: false
      t.integer :haisouryou_futan_id, null: false
      t.integer :todoufuken_id,	      null: false
      t.integer :hassou_nissuu_id,    null: false
      t.integer :kakaku,              null: false
      t.references :user,	            null: false, foreign_key: true
      t.timestamps
    end
  end
end
