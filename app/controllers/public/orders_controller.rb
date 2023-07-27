class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    @customer = current_customer
    @order.customer_id = current_customer.id
    # binding.pry
  end

  def check
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.shipping_fee = 800
    @total = 0
    @order.full_name = current_customer.full_name
  end
    # @order.postal_code = current_customer.postal_code
    # @order.address = current_customer.address
    # @order.full_name = current_customer.first_name + current_customer.last_name

  def thanks

  end

  def index

  end

  def show

  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :full_name, :payment_method, :total_due, :shipping_fee)

  end

end
