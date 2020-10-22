class RemoveDateFromCalculations < ActiveRecord::Migration[6.0]
  def change
    remove_column :calculations, :date, :date
  end
end
