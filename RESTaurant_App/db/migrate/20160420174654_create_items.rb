class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.references :itype, index: true, foreign_key: true
      t.decimal :price, precision: 6, scale: 2

      t.timestamps null: false
    end
  end
end
