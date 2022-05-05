class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  def add_tax_price
  (self.price * 1.10).round
  end
  validates :price, presence: true, inclusion: { in: 30..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :name, presence: true, length: { maximum: 99 }
  validates :introduction, presence: true, length: { maximum: 999 }
  validates :genre_id, presence: true
end
