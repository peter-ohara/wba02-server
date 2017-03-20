require 'test_helper'

class AndroidV1::UpvotesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get android_v1_upvotes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get android_v1_upvotes_destroy_url
    assert_response :success
  end

end
