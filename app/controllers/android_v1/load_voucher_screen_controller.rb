class AndroidV1::LoadVoucherScreenController < ApplicationController
  before_action :set_user
  before_action :set_voucher

  def load_voucher
    unless @voucher
      render json: 'Invalid voucher code', status: :unprocessable_entity
      return
    end

    if @voucher.used?
      render json: 'Used voucher code', status: :unprocessable_entity
    else
      @user.add_credits(@voucher)
      render json: @user, status: :created, location: @user
    end
  end


  private

  def set_voucher
    @voucher = Voucher.find_by(code: transaction_params[:voucher_code])
  end

  def set_user
    @user = User.find(transaction_params[:user_id])
  end

  # Only allow a trusted parameter "white list" through.
  def transaction_params
    params.permit(:user_id, :voucher_code)
  end
end
