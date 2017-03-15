class Comment < ApplicationRecord
  belongs_to :user, inverse_of: :comments
  belongs_to :commentable, polymorphic: true

  has_many :comments, as: :commentable

  belongs_to :parent,
             class_name: 'Comment',
             inverse_of: :replies,
             optional: true
  has_many :replies,
           class_name: 'Comment',
           foreign_key: 'parent_id',
           inverse_of: :parent

  has_many :upvotes, inverse_of: :comment, dependent: :destroy
  has_many :downvotes, inverse_of: :comment, dependent: :destroy

  validates :content, presence: true

  def name
    content.truncate 70 unless new_record?
  end
end
