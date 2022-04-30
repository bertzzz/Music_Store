# frozen_string_literal: true

class OrderController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[show total_price]

  def create
    @order = Order.find_or_create_by(
      cart_id: params[:cart_id],
      totalprice: params[:total_price] * 1.13
    )

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Please review your order details.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @order = Order.where(cart_id: @cart.id)
    @line_items = LineItem.where(cart_id: @cart.id)

    @tax = 1.13

    if params[:agree] == 'on'
      user = User.find_by(id: current_user.id)
      user.update(street: params[:street])
      user.update(city: params[:city])
      user.update(province: params[:province])
      user.update(postal: params[:postal])
      user.update(notes: params[:notes])
    end
  end
end
