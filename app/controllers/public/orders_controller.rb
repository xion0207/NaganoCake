class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    if @order = Order.new
      @cart_items = CartItem.where(customer_id: current_customer.id )
      @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
      @order = Order.new(order_params)
      if params[:order][:select_address] == "0"
         @order.postal_code = current_customer.postal_code
         @order.address = current_customer.address
         @order.name = current_customer.last_name + current_customer.first_name
      end
      if params[:order][:select_address] == "1"
         @address = Address.find(params[:order][:address_id])
         @order.postal_code = @address.postal_code
         @order.address = @address.address
         @order.name = @address.name
      end
    else
      redirect_to new_order_path
    end
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  def order_params
    params.require(:order).permit(:item_id, :customer_id, :subtotal, :payment_method, :status, :postal_code, :address, :name, :postage)
  end
end
