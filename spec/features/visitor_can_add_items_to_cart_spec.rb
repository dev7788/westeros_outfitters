require 'rails_helper'

RSpec.feature "Visitor can add items to cart" do
  scenario "they click on add to cart button" do
    category = Category.create(name: "weapons")
    category.items.create(name: "Ice", img: "image", price: 0.99)
    visit category_path(category)

    expect(page).to have_content("Cart: 0")

    click_on "Add to Cart"

    expect(page).to have_content("Ice has been added to your cart!")
    expect(page).to have_content("Cart: 0.99")
  end
end
