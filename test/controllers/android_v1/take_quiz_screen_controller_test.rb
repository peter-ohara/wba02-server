require 'test_helper'

class AndroidV1::TakeQuizzescreenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz = quizzes(:one)
  end

  test "should get index" do
    get android_v1_take_quiz_screen_url(@quiz)
    assert_response :success
  end

  test "should show quiz_content" do
    get android_v1_take_quiz_screen_url(@quiz)
    assert_response :success
  end
end
