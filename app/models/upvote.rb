class Upvote < ApplicationRecord
  belongs_to :user, inverse_of: :upvotes
  belongs_to :comment, inverse_of: :upvotes

  validates :user,
            uniqueness: { scope: :comment, message: 'cannot upvote twice' }

  def name
    "#{user.name}::#{comment.name}" unless new_record?
  end
end
