class FillInQuestion < ApplicationRecord
  belongs_to :quiz, inverse_of: :fill_in_questions

  has_many :comments, as: :commentable
  has_many :answers, as: :answerable

  validates :priority, :number, :question, presence: true
  validates :priority, numericality: true

  def title
    "#{number}: #{question.truncate 70}" unless new_record?
  end
end
