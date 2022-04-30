# frozen_string_literal: true

module CurrentCart
  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
  end
end
