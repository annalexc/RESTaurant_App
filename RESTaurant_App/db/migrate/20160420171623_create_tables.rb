class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :table_num
      t.integer :is_paid
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
