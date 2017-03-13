class AddUniquenessIndexToDownvotes < ActiveRecord::Migration[5.0]
  def change
    add_index :downvotes, [:user_id, :comment_id], unique: true
  end
end
