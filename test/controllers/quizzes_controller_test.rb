require 'test_helper'

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz = quizzes(:one)
  end

  test "should get index" do
    get quizzes_url, as: :json
    assert_response :success
  end

  test "should create quiz" do
    assert_difference('Quiz.count') do
      post quizzes_url, params: { quiz: { course_id: @quiz.course_id, duration: @quiz.duration, instructions: @quiz.instructions, quiz_type: @quiz.quiz_type, year: @quiz.year } }, as: :json
    end

    assert_response 201
  end

  test "should show quiz" do
    get quiz_url(@quiz), as: :json
    assert_response :success
  end

  test "should update quiz" do
    patch quiz_url(@quiz), params: { quiz: { course_id: @quiz.course_id, duration: @quiz.duration, instructions: @quiz.instructions, quiz_type: @quiz.quiz_type, year: @quiz.year } }, as: :json
    assert_response 200
  end

  test "should destroy quiz" do
    assert_difference('Quiz.count', -1) do
      delete quiz_url(@quiz), as: :json
    end

    assert_response 204
  end
end