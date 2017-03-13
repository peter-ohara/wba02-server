class Header < ApplicationRecord
  belongs_to :quiz, inverse_of: :headers

  has_many :comments, as: :commentable

  validates :priority, :title, :content, presence: true
  validates :priority, numericality: true
end
