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
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    
    current_customer.cart_items.destroy_all
    redirect_to public_orders_complete_path
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
    params.require(:order).permit(:name, :postal_code, :address, :total_payment, :payment_method)
  end

end