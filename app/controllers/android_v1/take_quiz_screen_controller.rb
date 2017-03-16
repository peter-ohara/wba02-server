class AndroidV1::TakeQuizScreenController < ApplicationController
  before_action :set_quiz, only: [:show]

  # GET /android_v1/take_quiz_screen
  def index
    render json: []
  end

  # GET /android_v1/take_quiz_screen/1
  def show
    render json: @quiz
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end