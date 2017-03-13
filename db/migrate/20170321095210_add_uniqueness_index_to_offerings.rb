class AddUniquenessIndexToOfferings < ActiveRecord::Migration[5.0]
  def change
    add_index :offerings, [:programme_id, :course_id], unique: true
  end
end
