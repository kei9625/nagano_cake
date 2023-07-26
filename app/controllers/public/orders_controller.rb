class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    
  end

  def check
    
  end

  def thanks
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order)

  end

end
