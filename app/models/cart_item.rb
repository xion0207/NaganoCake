class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  def subtotal
    item.add_tax_price * amount
  end
  validates :amount, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:100 }
  validates :item_id, presence: true
end
