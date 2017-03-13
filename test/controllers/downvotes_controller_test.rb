require 'test_helper'

class DownvotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @downvote = downvotes(:one)
  end

  test "should get index" do
    get downvotes_url, as: :json
    assert_response :success
  end

  test "should create downvote" do
    assert_difference('Downvote.count') do
      post downvotes_url, params: { downvote: { comment_id: @downvote.comment_id, user_id: @downvote.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show downvote" do
    get downvote_url(@downvote), as: :json
    assert_response :success
  end

  test "should update downvote" do
    patch downvote_url(@downvote), params: { downvote: { comment_id: @downvote.comment_id, user_id: @downvote.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy downvote" do
    assert_difference('Downvote.count', -1) do
      delete downvote_url(@downvote), as: :json
    end

    assert_response 204
  end
end
