require 'test_helper'

class EssayQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @essay_question = essay_questions(:one)
  end

  test "should get index" do
    get essay_questions_url, as: :json
    assert_response :success
  end

  test "should create essay_question" do
    assert_difference('EssayQuestion.count') do
      post essay_questions_url, params: { essay_question: { answer: @essay_question.answer, explanation: @essay_question.explanation, number: @essay_question.number, priority: @essay_question.priority, question: @essay_question.question, quiz_id: @essay_question.quiz_id } }, as: :json
    end

    assert_response 201
  end

  test "should show essay_question" do
    get essay_question_url(@essay_question), as: :json
    assert_response :success
  end

  test "should update essay_question" do
    patch essay_question_url(@essay_question), params: { essay_question: { answer: @essay_question.answer, explanation: @essay_question.explanation, number: @essay_question.number, priority: @essay_question.priority, question: @essay_question.question, quiz_id: @essay_question.quiz_id } }, as: :json
    assert_response 200
  end

  test "should destroy essay_question" do
    assert_difference('EssayQuestion.count', -1) do
      delete essay_question_url(@essay_question), as: :json
    end

    assert_response 204
  end
end
