class Public::CartItemsController < ApplicationController
  def index
    @cart_items=current_customer.cart_items
  end

  def create

  end

  def update

  end

  def destroy

  end

  def destroy_all

  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
