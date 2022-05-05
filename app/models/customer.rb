class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # def active_for_authentication?
  #   super && (is_deleted == true)
  # end

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  def customer_address_display
  '〒' + postal_code.to_s.insert(3, "-") + ' ' + address + ' ' + last_name + first_name
  end
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  KANA = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, presence: true, format: { with: KANA }, length: { maximum: 20 }
  validates :first_name_kana, presence: true, format: { with: KANA }, length: { maximum: 20 }
  validates :postal_code, numericality: {only_integer: true}, length: { is: 7 }
  validates :address, presence: true
  validates :telephone_number, numericality: {only_integer: true}, length: { in: 9..11 }
  validates :postal_code, numericality: {only_integer: true}
end
