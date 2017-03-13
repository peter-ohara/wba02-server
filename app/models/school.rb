class School < ApplicationRecord
  has_many :programmes, inverse_of: :school, dependent: :destroy

  validates :name, :short_name, presence: true
  validates :name, :short_name, uniqueness: { case_sensitive: false }
end
