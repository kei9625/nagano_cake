class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def subtotal
   (((item.price * 1.1).floor*amount).to_i)
  end

end
