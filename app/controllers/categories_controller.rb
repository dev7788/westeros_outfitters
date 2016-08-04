class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(name: params[:name].tr("-", " "))
    if @category.nil?
      render file: "app/views/errors/not_found.html.erb"
    else
      @items = @category.items
      @name = @category[:name]
    end
  end
end
