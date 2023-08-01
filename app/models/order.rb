class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :full_name, presence: true
  validates :payment_method, presence:true 

  enum payment_method: { credit_card: 0, bank_transfer: 1 }

end
