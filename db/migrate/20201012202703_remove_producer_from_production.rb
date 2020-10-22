class RemoveProducerFromProduction < ActiveRecord::Migration[6.0]
  def change
    remove_reference :productions, :producer, null: false, foreign_key: true
  end
end
