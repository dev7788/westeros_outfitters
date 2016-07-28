class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @category = Category.find(params[:category_id])
    @item = @category.items.new
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :img)
  end
end
