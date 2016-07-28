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

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = 'Item successfully created!'
      redirect_to item_path(@item)
    else
      flash[:error] = 'Those are not valid inputs.'
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :img, :description)
  end
end
