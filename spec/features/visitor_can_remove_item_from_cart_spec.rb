require 'rails_helper'

RSpec.feature 'Visitor can remove items to cart' do
  scenario 'they click on remove and view the cart path' do
    category = Category.create!(name: 'weapons')
    item = category.items.create!(name: 'Ice', img: 'image', price: 0.99, description: "it's cold")
    visit category_path(category)

    expect(page).to have_content('Cart (0 Items)')

    click_on 'Add to Cart'

    expect(page).to have_content('Ice has been added to your cart!')
    expect(page).to have_content('Cart (1 Items)')

    click_on 'View Cart'

    click_on 'Remove'

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Successfully removed Ice from your cart.")
    expect(page).to have_content('Cart (0 Items)')

    click_on "Ice"

    expect(current_path).to eq(item_path(item))
  end
end
