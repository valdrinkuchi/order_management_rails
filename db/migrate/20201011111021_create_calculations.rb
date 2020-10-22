class CreateCalculations < ActiveRecord::Migration[6.0]
  def change
    create_table :calculations do |t|
      t.references :production, null: false, foreign_key: true
      t.date :date
      t.float :sale_neto
      t.float :sale_vat
      t.float :sale_gross
      t.float :buy_neto
      t.float :buy_bonus
      t.float :buy_gross
      t.float :profit
      t.integer :days_late
      t.float :amount_difference
      t.string :description


      t.timestamps
    end
  end
end
