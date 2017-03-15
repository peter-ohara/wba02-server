class RemoveParentFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_reference :comments, :parent, index: true
  end
end
