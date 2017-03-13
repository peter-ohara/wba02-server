class CreateOfferings < ActiveRecord::Migration[5.0]
  def change
    create_table :offerings do |t|
      t.references :programme, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
