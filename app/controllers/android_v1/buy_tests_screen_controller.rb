class AndroidV1::BuyTestsScreenController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]

  # GET /courses
  def index
    @courses = Course.order(:code)

    render json: @courses
  end

  # GET /courses/1
  def show
    render json: @course
  end

  # POST /buy_tests
  def buy_tests
    params.permit(:test_ids)
    quiz_ids = params[:test_ids]

    begin
      @current_user.buy_quizzes(quiz_ids)
      render json: @current_user
    rescue ArgumentError => e
      render json: e.message, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def course_params
    params.require(:course).permit(:code, :name, :level, :semester)
  end
end
