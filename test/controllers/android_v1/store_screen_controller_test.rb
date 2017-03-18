require 'test_helper'

class AndroidV1::StoreScreenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get android_v1_store_screen_index_url
    assert_response :success
  end

  test "should get show" do
    get android_v1_store_screen_show_url
    assert_response :success
  end

end
