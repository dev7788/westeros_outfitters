class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(name: params[:name])
    # require "pry"; binding.pry
    @items = @category.items
    @name = @category[:name]
  end
end
