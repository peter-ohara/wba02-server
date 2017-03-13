require 'test_helper'

class MultipleChoiceQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multiple_choice_question = multiple_choice_questions(:one)
  end

  test "should get index" do
    get multiple_choice_questions_url, as: :json
    assert_response :success
  end

  test "should create multiple_choice_question" do
    assert_difference('MultipleChoiceQuestion.count') do
      post multiple_choice_questions_url, params: { multiple_choice_question: { answer: @multiple_choice_question.answer, choices: @multiple_choice_question.choices, explanation: @multiple_choice_question.explanation, number: @multiple_choice_question.number, priority: @multiple_choice_question.priority, question: @multiple_choice_question.question, quiz_id: @multiple_choice_question.quiz_id } }, as: :json
    end

    assert_response 201
  end

  test "should show multiple_choice_question" do
    get multiple_choice_question_url(@multiple_choice_question), as: :json
    assert_response :success
  end

  test "should update multiple_choice_question" do
    patch multiple_choice_question_url(@multiple_choice_question), params: { multiple_choice_question: { answer: @multiple_choice_question.answer, choices: @multiple_choice_question.choices, explanation: @multiple_choice_question.explanation, number: @multiple_choice_question.number, priority: @multiple_choice_question.priority, question: @multiple_choice_question.question, quiz_id: @multiple_choice_question.quiz_id } }, as: :json
    assert_response 200
  end

  test "should destroy multiple_choice_question" do
    assert_difference('MultipleChoiceQuestion.count', -1) do
      delete multiple_choice_question_url(@multiple_choice_question), as: :json
    end

    assert_response 204
  end
end
