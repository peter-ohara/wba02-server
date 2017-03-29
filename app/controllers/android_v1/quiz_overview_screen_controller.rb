class AndroidV1::QuizOverviewScreenController < ApplicationController
  # GET /android_v1/quiz_overview_screen
  def index
    render json: []
  end

  # GET /android_v1/quiz_overview_screen/1
  def show
    @quiz = Quiz.find(params[:id])
    render json: @quiz
  end
end
