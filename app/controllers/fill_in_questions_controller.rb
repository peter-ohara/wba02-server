class FillInQuestionsController < ApplicationController
  before_action :set_fill_in_question, only: [:show, :update, :destroy]

  # GET /fill_in_questions
  def index
    @fill_in_questions = FillInQuestion.all

    render json: @fill_in_questions
  end

  # GET /fill_in_questions/1
  def show
    render json: @fill_in_question
  end

  # POST /fill_in_questions
  def create
    @fill_in_question = FillInQuestion.new(fill_in_question_params)

    if @fill_in_question.save
      render json: @fill_in_question, status: :created, location: @fill_in_question
    else
      render json: @fill_in_question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fill_in_questions/1
  def update
    if @fill_in_question.update(fill_in_question_params)
      render json: @fill_in_question
    else
      render json: @fill_in_question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fill_in_questions/1
  def destroy
    @fill_in_question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fill_in_question
      @fill_in_question = FillInQuestion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fill_in_question_params
      params.require(:fill_in_question).permit(:quiz_id, :priority, :number, :question, :answer, :explanation)
    end
end
