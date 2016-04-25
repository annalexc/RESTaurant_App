class AddCompletedFlagToOrders < ActiveRecord::Migration
  def change
     add_column :orders, :is_completed, :integer, default: 0
  end
end
