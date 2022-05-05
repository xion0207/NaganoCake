class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id )
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @postage = 800
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
    if params[:order][:select_address] == nil
      redirect_to new_order_path
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = CartItem.where(customer_id: current_customer.id )
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.create({ id: Order.new(order_params), item_id: cart_item.item_id, order_id: @order.id , amount: cart_item.amount, making_status: 0 , tax_included_price: cart_item.item.add_tax_price })
    end
    @cart_item = current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :subtotal, :payment_method, :status, :postal_code, :address, :name, :postage)
  end

  def order_detail_params
      params.require(:order_detail).permit(:item_id, :order_id, :amount, :making_status, :tax_included_price)
  end
end
