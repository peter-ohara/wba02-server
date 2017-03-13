require 'test_helper'

class AndroidV1::MainScreenControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get android_v1_main_screen_index_url
    assert_response :success
  end
end
