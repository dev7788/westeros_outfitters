class ItemCartsController < ApplicationController
  before_action :set_item, only: [:create, :increment, :decrement]

  def set_item
    @item = Item.find(params[:id])
  end

  def create
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    flash[:alert] = "#{@item.name} has been added to your cart!"
    redirect_to items_path
  end

  def show
    @items = @cart.items
  end

  def increment
    @cart.add_item(@item.id)
    redirect_to cart_path
  end

  def decrement
    @cart.subtract_item(@item.id)
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
