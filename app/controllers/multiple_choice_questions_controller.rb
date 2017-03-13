class MultipleChoiceQuestionsController < ApplicationController
  before_action :set_multiple_choice_question, only: [:show, :update, :destroy]

  # GET /multiple_choice_questions
  def index
    @multiple_choice_questions = MultipleChoiceQuestion.all

    render json: @multiple_choice_questions
  end

  # GET /multiple_choice_questions/1
  def show
    render json: @multiple_choice_question
  end

  # POST /multiple_choice_questions
  def create
    @multiple_choice_question = MultipleChoiceQuestion.new(multiple_choice_question_params)

    if @multiple_choice_question.save
      render json: @multiple_choice_question, status: :created, location: @multiple_choice_question
    else
      render json: @multiple_choice_question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /multiple_choice_questions/1
  def update
    if @multiple_choice_question.update(multiple_choice_question_params)
      render json: @multiple_choice_question
    else
      render json: @multiple_choice_question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /multiple_choice_questions/1
  def destroy
    @multiple_choice_question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multiple_choice_question
      @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def multiple_choice_question_params
      params.require(:multiple_choice_question).permit(:quiz_id, :priority, :number, :question, :choices, :answer, :explanation)
    end
end
