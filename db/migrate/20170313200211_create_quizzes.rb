class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.references :course, foreign_key: true
      t.string :instructions
      t.float :duration
      t.integer :quiz_type
      t.integer :year

      t.timestamps
    end
  end
end
