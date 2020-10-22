class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.integer :number
      t.string :name
      t.string :short_name
      t.string :address
      t.string :delivery_address

      t.timestamps
    end
  end
end
