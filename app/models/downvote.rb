class Downvote < ApplicationRecord
  belongs_to :user, inverse_of: :downvotes
  belongs_to :comment, inverse_of: :downvotes

  validates :user,
            uniqueness: { scope: :comment, message: 'cannot downvote twice' }

  def name
    "#{user.name}::#{comment.name}" unless new_record?
  end
end
