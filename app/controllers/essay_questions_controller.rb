class EssayQuestionsController < ApplicationController
  before_action :set_essay_question, only: [:show, :update, :destroy]

  # GET /essay_questions
  def index
    @essay_questions = EssayQuestion.all

    render json: @essay_questions
  end

  # GET /essay_questions/1
  def show
    render json: @essay_question
  end

  # POST /essay_questions
  def create
    @essay_question = EssayQuestion.new(essay_question_params)

    if @essay_question.save
      render json: @essay_question, status: :created, location: @essay_question
    else
      render json: @essay_question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /essay_questions/1
  def update
    if @essay_question.update(essay_question_params)
      render json: @essay_question
    else
      render json: @essay_question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /essay_questions/1
  def destroy
    @essay_question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_essay_question
      @essay_question = EssayQuestion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def essay_question_params
      params.require(:essay_question).permit(:quiz_id, :priority, :number, :question, :answer, :explanation)
    end
end
