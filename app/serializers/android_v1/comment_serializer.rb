class AndroidV1::CommentSerializer < ActiveModel::Serializer
  attributes :user_id,

             :parent,

             :created,
             :modified,

             :content,

             :file,
             :file_url,
             :file_mime_type,
             :fullname,
             :profile_url,
             :profile_picture_url,
             :created_by_admin,
             :created_by_current_user,
             :upvote_count,
             :user_has_upvoted

  def parent
    object.commentable_id
  end

  def file_url
    'fileUrl'
  end

  def file
    'file'
  end

  def file_mime_type
    'fileMimeType'
  end

  def fullname
    object.user.display_name
  end

  def profile_url
    'user.profileUrl'
  end

  def profile_picture_url
    'user.profilePictureURL'
  end

  def created_by_admin
    false
  end

  def created_by_current_user
    true
  end

  def upvote_count
    object.upvotes.count
  end

  def user_has_upvoted
    false
  end
end
