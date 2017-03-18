class AndroidV1::QuizSerializer < ActiveModel::Serializer
  attribute :title
  attribute :profile_picture_url

  has_many :quiz_contents, serializer: AndroidV1::QuizContentSerializer

  def title
    object.name
  end

  def profile_picture_url
    current_user.profile_url
  end
end
