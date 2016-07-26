class ItemsController < ApplicationController

  def new
    @item= Item.new
  end

  def create
    @item= Item.new(item_params)
    if @item.save
      flash[:notice]= "Item Created"
      redirect_to items_path
    else
      flash[:error]= "Those are not valid inputs"
      render :new
    end
  end

  def show
    @item= Item.new
  end

  def index
    @items= Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:img,:categories_id)
  end

end
