class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.integer :number
      t.float :price
      t.date :signed
      t.date :due
      t.boolean :in_production, default: false

      t.timestamps
    end
  end
end
