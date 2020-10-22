class RemoveReferenceFromProductions < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :productions, :producers
  end
end
