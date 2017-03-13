class Offering < ApplicationRecord
  belongs_to :programme
  belongs_to :course

  validates :programme,
            uniqueness: { scope: :course, message: 'cannot offer course twice' }

  def title
    "#{programme.name}::#{course.title}" unless new_record?
  end
end
