class CreateHeaders < ActiveRecord::Migration[5.0]
  def change
    create_table :headers do |t|
      t.references :quiz, foreign_key: true
      t.integer :priority
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
