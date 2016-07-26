require 'rails_helper'

RSpec.feature "Visitor can add items to cart" do
  scenario "they click on add to cart button" do
    ice = Item.create(name: "Ice", img: "image", price: 0.99)

    visit items_path

    expect(page).to have_content("Cart: 0")

    click_on "Add to Cart"

    expect(page).to have_content("Ice was added to cart")
    expect(page).to have_content("Cart: 1")
  end
end
