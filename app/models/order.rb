class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  def full_name
    return last_name + ' ' + first_name
  end

  enum payment_method: { credit_card: 0, bank_transfer: 1 }

end
