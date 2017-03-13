require 'test_helper'

class VouchersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voucher = vouchers(:one)
  end

  test "should get index" do
    get vouchers_url, as: :json
    assert_response :success
  end

  test "should create voucher" do
    assert_difference('Voucher.count') do
      post vouchers_url, params: { voucher: { code: @voucher.code, credits: @voucher.credits, price_pesewas: @voucher.price_pesewas, print_time: @voucher.print_time, usage_time: @voucher.usage_time, user_id: @voucher.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show voucher" do
    get voucher_url(@voucher), as: :json
    assert_response :success
  end

  test "should update voucher" do
    patch voucher_url(@voucher), params: { voucher: { code: @voucher.code, credits: @voucher.credits, price_pesewas: @voucher.price_pesewas, print_time: @voucher.print_time, usage_time: @voucher.usage_time, user_id: @voucher.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy voucher" do
    assert_difference('Voucher.count', -1) do
      delete voucher_url(@voucher), as: :json
    end

    assert_response 204
  end
end
