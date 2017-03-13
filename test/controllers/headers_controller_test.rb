require 'test_helper'

class HeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @header = headers(:one)
  end

  test "should get index" do
    get headers_url, as: :json
    assert_response :success
  end

  test "should create header" do
    assert_difference('Header.count') do
      post headers_url, params: { header: { content: @header.content, priority: @header.priority, quiz_id: @header.quiz_id, title: @header.title } }, as: :json
    end

    assert_response 201
  end

  test "should show header" do
    get header_url(@header), as: :json
    assert_response :success
  end

  test "should update header" do
    patch header_url(@header), params: { header: { content: @header.content, priority: @header.priority, quiz_id: @header.quiz_id, title: @header.title } }, as: :json
    assert_response 200
  end

  test "should destroy header" do
    assert_difference('Header.count', -1) do
      delete header_url(@header), as: :json
    end

    assert_response 204
  end
end
