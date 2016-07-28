class ItemCartsController < ApplicationController

  def create
    @item = Item.find(params[:id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    flash[:alert] = "#{@item.name} has been added to your cart!"
    redirect_to items_path(@item)
  end

  def show
    @items = @cart.items
  end

  def update
    @item = Item.find(params[:id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    redirect_to cart_path
  end
end
