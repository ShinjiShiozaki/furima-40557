class CreateKounyuus < ActiveRecord::Migration[7.0]
  def change
    create_table :kounyuus do |t|
      t.references :item,	railenull: false, foreign_key: true
      t.references :user,	null: false, foreign_key: true
      t.timestamps
    end
  end
end