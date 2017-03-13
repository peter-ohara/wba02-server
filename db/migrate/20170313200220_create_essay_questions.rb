class CreateEssayQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :essay_questions do |t|
      t.references :quiz, foreign_key: true
      t.integer :priority
      t.string :number
      t.text :question
      t.text :answer
      t.text :explanation

      t.timestamps
    end
  end
end
