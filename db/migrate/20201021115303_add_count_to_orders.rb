class AddCountToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :count, :integer
  end
end
