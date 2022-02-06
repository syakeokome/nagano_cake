class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def complete
  end

  def index
  end

  def show
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    if params[:order_address] == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order_address] == 1
      @address = Address.find(params[:order][:address])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order.postal_code = params[:order][:new_postal_code]
      @order.address = params[:order][:new_address]
      @order.name = params[:order][:new_name]
    end
  end
end