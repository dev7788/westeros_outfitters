class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(name: params[:name].tr("-", " "))
    @items = @category.items
    @name = @category[:name]
  end
end
