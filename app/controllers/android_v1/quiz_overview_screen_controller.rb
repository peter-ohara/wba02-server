class AndroidV1::QuizOverviewScreenController < ApplicationController
  # GET /android_v1/quiz_overview_screen
  def index
    render json: []
  end

  # GET /android_v1/quiz_overview_screen/1
  def show
    @quiz = Quiz.find(params[:id])

    result = {
      "course_code": @quiz.course.code,
      "course_name": @quiz.course.name,
      "quiz_name": "#{@quiz.year} #{@quiz.quiz_type}",
      "quiz_duration": @quiz.duration.to_s,
      "instructions": @quiz.instructions
    }

    render json: result
  end
end
