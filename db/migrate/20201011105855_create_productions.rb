class CreateProductions < ActiveRecord::Migration[6.0]
  def change
    create_table :productions do |t|
      t.references :order, null: false, foreign_key: true
      t.references :producer, null: false, foreign_key: true
      t.integer :load_count
      t.float :price
      t.date :load_date
      t.float :bonus, default: 4

      t.timestamps
    end
  end
end
