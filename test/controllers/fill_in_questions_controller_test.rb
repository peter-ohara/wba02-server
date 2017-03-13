require 'test_helper'

class FillInQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fill_in_question = fill_in_questions(:one)
  end

  test "should get index" do
    get fill_in_questions_url, as: :json
    assert_response :success
  end

  test "should create fill_in_question" do
    assert_difference('FillInQuestion.count') do
      post fill_in_questions_url, params: { fill_in_question: { answer: @fill_in_question.answer, explanation: @fill_in_question.explanation, number: @fill_in_question.number, priority: @fill_in_question.priority, question: @fill_in_question.question, quiz_id: @fill_in_question.quiz_id } }, as: :json
    end

    assert_response 201
  end

  test "should show fill_in_question" do
    get fill_in_question_url(@fill_in_question), as: :json
    assert_response :success
  end

  test "should update fill_in_question" do
    patch fill_in_question_url(@fill_in_question), params: { fill_in_question: { answer: @fill_in_question.answer, explanation: @fill_in_question.explanation, number: @fill_in_question.number, priority: @fill_in_question.priority, question: @fill_in_question.question, quiz_id: @fill_in_question.quiz_id } }, as: :json
    assert_response 200
  end

  test "should destroy fill_in_question" do
    assert_difference('FillInQuestion.count', -1) do
      delete fill_in_question_url(@fill_in_question), as: :json
    end

    assert_response 204
  end
end
