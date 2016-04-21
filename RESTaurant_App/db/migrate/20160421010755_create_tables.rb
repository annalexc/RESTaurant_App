class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :table_num
      t.integer :num_seats
      t.integer :is_available, default: 1

      t.timestamps null: false
    end
  end
end
