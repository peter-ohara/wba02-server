require 'test_helper'

class OfferingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offering = offerings(:one)
  end

  test "should get index" do
    get offerings_url, as: :json
    assert_response :success
  end

  test "should create offering" do
    assert_difference('Offering.count') do
      post offerings_url, params: { offering: { course_id: @offering.course_id, programme_id: @offering.programme_id } }, as: :json
    end

    assert_response 201
  end

  test "should show offering" do
    get offering_url(@offering), as: :json
    assert_response :success
  end

  test "should update offering" do
    patch offering_url(@offering), params: { offering: { course_id: @offering.course_id, programme_id: @offering.programme_id } }, as: :json
    assert_response 200
  end

  test "should destroy offering" do
    assert_difference('Offering.count', -1) do
      delete offering_url(@offering), as: :json
    end

    assert_response 204
  end
end
