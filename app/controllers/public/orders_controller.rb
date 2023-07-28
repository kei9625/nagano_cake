class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    # current_customerはインスタンス変数で定義しなくてもどこでも使える。（ログイン中であれば）
  end

  def create
    @order = Order.new(order_params)
    # binding.pry
      if @order.save
        # saveの瞬間にorderのIDが生成される
        current_customer.cart_items.each do |cart_item|
          order_detail = OrderDetail.new
          order_detail.order_id = @order.id
          order_detail.item_id = cart_item.item.id
          order_detail.tax_price = (cart_item.item.price * 1.1).floor.to_i
          order_detail.amount = cart_item.amount
          order_detail.save
        end
            current_customer.cart_items.destroy_all
            redirect_to orders_thanks_path
      end
  end

  def check
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.shipping_fee = 800
    @total = 0
    @order.full_name = current_customer.full_name
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
  end


  def thanks

  end

  def index
    @orders = current_customer.orders
  end

  def show

  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :full_name, :payment_method, :total_due, :shipping_fee)

  end

end
