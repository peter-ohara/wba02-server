require 'test_helper'

class AndroidV1::StoreScreensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @android_v1_store_screen = android_v1_store_screens(:one)
  end

  test "should get index" do
    get android_v1_store_screens_url, as: :json
    assert_response :success
  end

  test "should create android_v1_store_screen" do
    assert_difference('AndroidV1::StoreScreen.count') do
      post android_v1_store_screens_url, params: { android_v1_store_screen: { code: @android_v1_store_screen.code, level: @android_v1_store_screen.level, name: @android_v1_store_screen.name, semester: @android_v1_store_screen.semester } }, as: :json
    end

    assert_response 201
  end

  test "should show android_v1_store_screen" do
    get android_v1_store_screen_url(@android_v1_store_screen), as: :json
    assert_response :success
  end

  test "should update android_v1_store_screen" do
    patch android_v1_store_screen_url(@android_v1_store_screen), params: { android_v1_store_screen: { code: @android_v1_store_screen.code, level: @android_v1_store_screen.level, name: @android_v1_store_screen.name, semester: @android_v1_store_screen.semester } }, as: :json
    assert_response 200
  end

  test "should destroy android_v1_store_screen" do
    assert_difference('AndroidV1::StoreScreen.count', -1) do
      delete android_v1_store_screen_url(@android_v1_store_screen), as: :json
    end

    assert_response 204
  end
end
