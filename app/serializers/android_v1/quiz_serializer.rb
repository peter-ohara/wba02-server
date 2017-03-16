class AndroidV1::QuizSerializer < ActiveModel::Serializer
  attribute :title

  has_many :quiz_contents, serializer: AndroidV1::QuizContentSerializer

  def title
    object.name
  end
end
