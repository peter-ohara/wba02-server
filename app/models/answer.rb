class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :answerable, polymorphic: true

  validates :content, presence: true
end
