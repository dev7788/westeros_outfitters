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

  def increment
    @item = Item.find(params[:id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    redirect_to cart_path
  end

  def decrement
    @item = Item.find(params[:id])
    @cart.subtract_item(@item.id)
    session[:cart] = @cart.contents
    redirect_to cart_path
  end

  def destroy
    @item = Item.find(params[:format])
    @cart.remove_item(@item.id)
    flash[:item_removed] = "Successfully removed " \
                           "#{view_context.link_to @item.name, item_path(@item)}" \
                           " from your cart."
    redirect_to cart_path
  end
end
