# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
before_action :customer_state, only: [:create]

protected

def customer_state
  @customer = Customer.find_by(email: params[:customer][:email])
  return if !@customer
  if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
      flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_customer_registration_path
  #else redirect_to root_path
  end
end
end
