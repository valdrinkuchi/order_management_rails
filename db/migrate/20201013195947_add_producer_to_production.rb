class AddProducerToProduction < ActiveRecord::Migration[6.0]
  def change
    add_reference :productions, :producer, null: false, foreign_key: true
  end
end
