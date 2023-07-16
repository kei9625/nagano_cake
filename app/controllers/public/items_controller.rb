class Public::ItemsController < ApplicationController
  def index
    @all_item = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end