class ChargesController < ApplicationController
  def new
    @amount = params[:amount]
    @description = 'MusiXpress inc.'
  end

  def create
    # Amount in cents
  @amount = params[:amount]

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'cad',
  })

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
  end
end
