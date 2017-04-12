class AddPascoCreditsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pasco_credits, :integer
  end
end
