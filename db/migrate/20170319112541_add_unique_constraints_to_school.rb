class AddUniqueConstraintsToSchool < ActiveRecord::Migration[5.0]
  def change
    add_index :schools, :name, unique: true
    add_index :schools, :short_name, unique: true
  end
end
