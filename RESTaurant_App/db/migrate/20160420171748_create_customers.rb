class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :customer_num
      t.references :party, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
