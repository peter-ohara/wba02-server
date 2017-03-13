require 'test_helper'

class AndroidV1::QuizOverviewScreenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz = quizzes(:one)
  end

  test "should get index" do
    get android_v1_quiz_overview_screen_url(@quiz)
    assert_response :success
  end

  test "should show quiz_overview" do
    get android_v1_quiz_overview_screen_url(@quiz)
    assert_response :success
  end
end
