require 'test_helper'

class ProgrammesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @programme = programmes(:one)
  end

  test "should get index" do
    get programmes_url, as: :json
    assert_response :success
  end

  test "should create programme" do
    assert_difference('Programme.count') do
      post programmes_url, params: { programme: { name: @programme.name, school_id: @programme.school_id } }, as: :json
    end

    assert_response 201
  end

  test "should show programme" do
    get programme_url(@programme), as: :json
    assert_response :success
  end

  test "should update programme" do
    patch programme_url(@programme), params: { programme: { name: @programme.name, school_id: @programme.school_id } }, as: :json
    assert_response 200
  end

  test "should destroy programme" do
    assert_difference('Programme.count', -1) do
      delete programme_url(@programme), as: :json
    end

    assert_response 204
  end
end
