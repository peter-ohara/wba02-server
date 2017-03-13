class AddPascoCreditsToQuiz < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :pasco_credits, :integer
  end
end
