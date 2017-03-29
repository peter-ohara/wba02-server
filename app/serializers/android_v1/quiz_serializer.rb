class AndroidV1::QuizSerializer < ActiveModel::Serializer

  attribute :id
  attribute :course_code
  attribute :course_name
  attribute :quiz_name
  attribute :name
  attribute :quiz_duration
  attribute :instructions

  attribute :profile_picture_url

  attribute :question_count

  attribute :pasco_credits

  attribute :quiz_contents



  # has_many :quiz_contents, serializer: AndroidV1::QuizContentSerializer

  def quiz_contents
    object.quiz_contents.map do |quiz_content|
      AndroidV1::QuizContentSerializer.new(quiz_content,
                                       scope: current_user,
                                       scope_name: :current_user)
    end
  end

  def title
    object.name
  end

  def course_code
    object.course.code
  end

  def course_name
    object.course.name
  end

  def quiz_name
    "#{object.year} #{object.quiz_type}"
  end

  def quiz_duration
    object.duration.to_s
  end

  def profile_picture_url
    current_user.profile_url
  end

  def question_count
    question_count = object.multiple_choice_questions.count
    question_count += object.fill_in_questions.count
    question_count += object.essay_questions.count
  end
end
