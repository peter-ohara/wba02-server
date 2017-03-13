class Programme < ApplicationRecord
  belongs_to :school, inverse_of: :programmes

  has_many :offerings, dependent: :destroy
  has_many :courses, through: :offerings

  validates :name, presence: true
end
