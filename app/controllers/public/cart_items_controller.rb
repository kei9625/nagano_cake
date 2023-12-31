class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!, only: [:create]

  def index
    @cart_items=current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item_new = CartItem.new(cart_item_params)
    @cart_item_new.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
     if @cart_item_new.item_id == cart_item.item_id
       new_amount = cart_item.amount + @cart_item_new.amount
       cart_item.update_attribute(:amount, new_amount)
       # cart_itemモデルのamountをnew_amountに更新するという意味？らしい
       @cart_item_new.delete
     end
   end
    @cart_item_new.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
