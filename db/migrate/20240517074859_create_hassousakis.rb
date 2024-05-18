class CreateHassousakis < ActiveRecord::Migration[7.0]
  def change
    create_table :hassousakis do |t|
      t.string :yuubin_bangou,  null: false
      t.integer :todoufuken_id, null: false
      t.string :shikuchouson,   null: false
      t.string :banchi,         null: false
      t.string :tatemono,       null: true
      t.string :denwabango,     null: true
      t.references :kounyuu,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
