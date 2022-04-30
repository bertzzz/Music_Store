# frozen_string_literal: true

class LineItemsController < InheritedResources::Base
  include CurrentCart
  before_action :set_line_item, only: %i[show edit update destroy]
  before_action :set_cart, only: [:create]

  def qty
    @item = LineItem.find(params[:id])
    @cart = Cart.find(session[:cart_id])

    if request.post? #-> increment
      method = 'increment'
    elsif request.delete? #-> decrement
      method = 'decrement'
    end

    @item.send(method, :quantity, 1)

    respond_to do |format|
      if @item.save
        format.html { redirect_to cart_path(@cart), notice: 'Item was successfully updated.' }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
     end
    end
  end

  def create
    instrument = Instrument.find(params[:instrument_id])
    @line_item = @cart.add_instrument(instrument)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: 'Item added to cart.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: 'Item successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:instrument_id)
  end
end
