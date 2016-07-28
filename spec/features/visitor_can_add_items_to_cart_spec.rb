require 'rails_helper'

RSpec.feature 'Visitor can add items to cart' do
  scenario 'they click on add to cart and view the cart path' do
    category = Category.create!(name: 'weapons')
    category.items.create!(name: 'Ice', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg', price: 0.99, description: "it's cold")
    visit category_path(category)

    expect(page).to have_content('View Cart (0 Items)')

    click_on 'Add to Cart'

    expect(page).to have_content('Ice has been added to your cart!')
    expect(page).to have_content('View Cart (1 Items)')

    click_on 'View Cart (1 Items)'

    expect(current_path).to eq(cart_path)
    expect(page).to have_content('Your Cart')
    expect(page).to have_content ('Ice')
    expect(page).to have_css ('img[src="http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg"]')
    expect(page).to have_content ('$0.99')
    expect(page).to have_content ("it's cold")
    expect(page).to have_content ('Total: $0.99')
  end
end
