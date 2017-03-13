class Course < ApplicationRecord
  has_many :offerings, dependent: :destroy
  has_many :programmes, through: :offerings

  enum level: [100, 200, 300, 400, 500, 600, 700]
  enum semester: [1, 2]

  has_many :quizzes, inverse_of: :course, dependent: :destroy

  validates :code, :name, presence: true

  def title
    "#{code} #{name}" unless new_record?
  end
end
