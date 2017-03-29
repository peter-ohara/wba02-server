class AndroidV1::CourseSerializer < ActiveModel::Serializer
  attribute :id
  attribute :code
  attribute :name
  attribute :level
  attribute :semester

  attribute :midsem_count
  attribute :class_test_count
  attribute :end_of_sem_count
  attribute :assignment_count

  has_many :quizzes, serializer: AndroidV1::QuizSerializer


  def midsem_count
    object.quizzes.count(:quiz_type == 1).to_s
  end

  def class_test_count
    object.quizzes.count(:quiz_type == 2).to_s
  end

  def end_of_sem_count
    object.quizzes.count(:quiz_type == 3).to_s
  end

  def assignment_count
    object.quizzes.count(:quiz_type == 4).to_s
  end

end
