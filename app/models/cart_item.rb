class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  # validates :amount, numericality: { greater_than_or_equal_to: 1, message: "は1以上を選択してください" }

  def subtotal
   (((item.price * 1.1).floor*amount).to_i)
  end

end
