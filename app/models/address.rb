class Address < ApplicationRecord
  belongs_to :customer
  def address_display
  '〒' + postal_code.to_s.insert(3, "-") + ' ' + address + ' ' + name
  end
  validates :postal_code, presence: true, length: { minimum: 1, maximum: 10 }
  validates :name, presence: true, length: { minimum: 1, maximum: 99 }
  validates :address, presence: true, length: { minimum: 1, maximum: 999 }

end
