class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :size
      t.integer :is_paid, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
