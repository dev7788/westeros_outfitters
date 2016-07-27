class ItemsController < ApplicationController

  #do not need yet
  # def index
  #   @items = Item.all
  # end

  def new
    @category = Category.find(params[:category_id])
    @item = @category.items.new
  end

  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.new(item_params)
    if @item.save
      flash[:notice] = 'Item Created'
      redirect_to items_path
    else
      flash[:error] = 'Those are not valid inputs'
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :img)
  end

end
