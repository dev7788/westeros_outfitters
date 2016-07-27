require 'rails_helper'

RSpec.feature 'Visitor can add items to cart' do
  scenario 'they click on add to cart and view the cart path' do
    category = Category.create(name: 'weapons')
    category.items.create(name: 'Ice', img: 'image', price: 0.99, description: "it's cold")
    visit category_path(category)

    expect(page).to have_content('Cart: 0')

    click_on 'Add to Cart'

    expect(page).to have_content('Ice has been added to your cart!')
    expect(page).to have_content('Cart: 1')

    click_on 'View Cart'

    expect(page).to eq(carts_path)
    expect(page).to have_content('Your Cart')
    expect(page).to have_content ('Ice')
    expect(page).to have_content ('image')
    expect(page).to have_content ('$0.99')
    expect(page).to have_content ("it's cold")
    expect(page).to have_content ('Total: $0.99')
  end
end
