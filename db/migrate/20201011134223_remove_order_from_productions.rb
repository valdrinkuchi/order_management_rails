class RemoveOrderFromProductions < ActiveRecord::Migration[6.0]
  def change
    remove_reference :productions, :order, null: false, foreign_key: true
  end
end
