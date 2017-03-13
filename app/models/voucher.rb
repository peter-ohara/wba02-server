class Voucher < ApplicationRecord
  belongs_to :user, inverse_of: :vouchers, optional: true

  validates :code, :credits, :price_pesewas, presence: true

  # code must be a 14 digit integer
  validates :code, length: { is: 14 }, numericality: { only_integer: true }

  # credits must be an integer greater than 0
  validates :credits, numericality: { only_integer: true, greater_than: 0 }

  # price_pesewas must be an integer greater than 0
  validates :credits, numericality: { only_integer: true, greater_than: 0 }
end