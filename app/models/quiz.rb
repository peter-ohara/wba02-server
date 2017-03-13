class Quiz < ApplicationRecord
  belongs_to :course, inverse_of: :quizzes

  enum quiz_type: [:mid_semester, :end_of_semester, :class_test]
  serialize :instructions, Array

  has_many :headers, inverse_of: :quiz, dependent: :destroy
  has_many :essay_questions, inverse_of: :quiz, dependent: :destroy
  has_many :fill_in_questions, inverse_of: :quiz, dependent: :destroy
  has_many :multiple_choice_questions, inverse_of: :quiz, dependent: :destroy

  has_many :purchases, dependent: :destroy
  has_many :users, through: :purchases

  validates :quiz_type, :pasco_credits, presence: true
  validates :pasco_credits, numericality: { only_integer: true, greater_than: 0 }


  def name
    "#{course.code} #{year} #{quiz_type}" unless new_record?
  end

end
