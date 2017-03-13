class CreateVouchers < ActiveRecord::Migration[5.0]
  def change
    create_table :vouchers do |t|
      t.string :code
      t.integer :credits
      t.integer :price_pesewas
      t.datetime :print_time
      t.datetime :usage_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
