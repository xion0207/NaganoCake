class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @address = Address.new
    @addresses = Address.page(params[:page])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    address.save
    redirect_to addresses_path
  end

  def destroy
  end

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end