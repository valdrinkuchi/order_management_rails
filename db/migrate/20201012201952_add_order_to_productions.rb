class AddOrderToProductions < ActiveRecord::Migration[6.0]
  def change
    add_reference :productions, :order, null: false, foreign_key: true
  end
end
