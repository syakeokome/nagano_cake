class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.price = cart_item.item.prise
        @order_detail.amount = cart_item.amount
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to public_orders_complete_path
    end
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    @order.shipping_cost = 800
    if params[:order_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order_address] == "1"
      @address = Address.find(params[:order][:registard_address])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

   private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :total_payment, :payment_method, :shipping_cost)
  end

end