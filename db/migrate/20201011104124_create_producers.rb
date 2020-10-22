class CreateProducers < ActiveRecord::Migration[6.0]
  def change
    create_table :producers do |t|
      t.integer :number
      t.string :name
      t.string :short_name
      t.string :address
      t.float :bonus

      t.timestamps
    end
  end
end
