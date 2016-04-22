class AddTableRefToParties < ActiveRecord::Migration
  def change
    add_reference :parties, :table, index: true, foreign_key: true
  end
end
