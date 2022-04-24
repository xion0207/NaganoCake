class Address < ApplicationRecord
  belongs_to :customer
  validates :postal_code, presence: true, length: { minimum: 1, maximum: 10 }
  validates :name, presence: true, length: { minimum: 1, maximum: 99 }
  validates :address, presence: true, length: { minimum: 1, maximum: 999 }

end
