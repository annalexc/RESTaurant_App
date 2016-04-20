class CreateItypes < ActiveRecord::Migration
  def change
    create_table :itypes do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
