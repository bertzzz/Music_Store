# frozen_string_literal: true

class InstrumentsController < InheritedResources::Base
  include Pagy::Backend

  def index
    @pagy, @instruments = pagy(Instrument.all.order('created_at desc'), items: 4)
  end

  def show
    set_instrument
  end

  # GET /instruments/search_results
  def search_results
    @query = params[:query]
    @category = params[:category]

    case @category
    when 'Drums'
      @category = '1'
    when 'Keyboards'
      @category = '2'
    when 'Guitars'
      @category = '3'
        end

    if @category == 'All'
      @instruments = Instrument.where('model LIKE ?', "%#{@query}%")
    else
      @instruments = Instrument.where('model LIKE ? AND category_id = ?', "%#{@query}%", @category.to_s)
    end
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:brand, :model, :description, :condition, :finish, :title, :price, :image)
  end
end
