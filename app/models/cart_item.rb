class CartItem < ApplicationRecord

  belongs_to :cusomer
  belongs_to :item

  def subtotal
    (self.item.tax_price).round*(self.amount)

  end

end
