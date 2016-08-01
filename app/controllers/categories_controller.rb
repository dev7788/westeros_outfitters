class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(name: params[:name].tr("-", " "))
    @items = @category.items
    @name = @category[:name]
  end
end
