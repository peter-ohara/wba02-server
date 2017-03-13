class User < ApplicationRecord
  has_many :comments, inverse_of: :user, dependent: :destroy

  has_many :upvotes, inverse_of: :user, dependent: :destroy
  has_many :downvotes, inverse_of: :user, dependent: :destroy

  has_many :answers, inverse_of: :user, dependent: :destroy

  has_many :purchases, inverse_of: :user, dependent: :destroy

  has_many :purchases, dependent: :destroy
  has_many :quizzes, through: :purchases

  has_many :vouchers, inverse_of: :user

  validates :display_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def name
    display_name unless new_record?
  end
end
