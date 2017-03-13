class AddUniquenessIndexToUpvotes < ActiveRecord::Migration[5.0]
  def change
    add_index :upvotes, [:user_id, :comment_id], unique: true
  end
end
