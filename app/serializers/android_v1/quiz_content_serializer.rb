class AndroidV1::QuizContentSerializer < ActiveModel::Serializer

  attribute :id
  attribute :priority
  attribute :type
  attribute :title
  attribute :content
  attribute :comments
  attribute :choices, if: 'object.is_a?(MultipleChoiceQuestion)'
  attribute :answer, unless: 'object.is_a?(Header)'
  attribute :explanation, unless: 'object.is_a?(Header)'

  def type
    if object.is_a?(Header)
      'Header'
    elsif object.is_a?(EssayQuestion)
      'EssayQuestion'
    elsif object.is_a?(FillInQuestion)
      'FillInQuestion'
    elsif object.is_a?(MultipleChoiceQuestion)
      'MultipleChoiceQuestion'
    end
  end

  def title
    if object.is_a?(Header)
      object.title
    else
      object.number
    end
  end

  def content
    if object.is_a?(Header)
      object.content
    else
      object.question
    end
  end

  def comments
    current_user
    object.comments.map do |comment|
      AndroidV1::CommentSerializer.new(comment,
                                       scope: current_user,
                                       scope_name: :current_user)
    end
  end

end