class Voucher < ApplicationRecord
  belongs_to :user, inverse_of: :vouchers, optional: true

  validates :code, :credits, :price_pesewas, presence: true

  # code must be a 14 digit integer
  validates :code, length: { is: 14 }, numericality: { only_integer: true }

  # credits must be an integer greater than 0
  validates :credits, numericality: { only_integer: true, greater_than: 0 }

  # price_pesewas must be an integer greater than 0
  validates :credits, numericality: { only_integer: true, greater_than: 0 }


  def self.create_vouchers(number, pasco_credits, price)
    vouchers = []
    transaction do
      (1..number).each do
        voucher = create_voucher(pasco_credits, price)
        vouchers.push(voucher)
      end
    end
    vouchers
  end

  def self.create_voucher(pasco_credits, price)
    voucher_code = SecureRandom.uuid.delete('-').hex.to_s[0..13].to_i
    Voucher.create!(code: voucher_code,
                    credits: pasco_credits,
                    price_pesewas: price * 100)
  end
end