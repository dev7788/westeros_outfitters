require 'pry'
class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:name])
    @items = @category.items
    @name = @category[:name]
  end
end
