class AndroidV1::MainScreenController < ApplicationController
  def index
    @courses = Course.order(:code)

    result = Hash.new

    @courses.each do |course|
      result[course.code] = []

      quizzes = Quiz.where(course_id: course)
      quizzes.each do |quiz|

        question_count = quiz.multiple_choice_questions.count
        question_count += quiz.fill_in_questions.count
        question_count += quiz.essay_questions.count

        result[course.code].push(id: quiz.id,
                                 course_code: quiz.course.code,
                                 name: "#{quiz.year} #{quiz.quiz_type}",
                                 question_count: question_count)
      end
    end

    render json: @courses
  end
end
