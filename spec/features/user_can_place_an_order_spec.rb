require 'rails_helper'

RSpec.feature 'User can place an order' do
  scenario 'they add two items to their cart and check out' do

    category = Category.create!(name: 'weapons')
    item = category.items.create!(id: 15, name: 'Ice', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg', price: 0.99, description: "it's cold")
    user = User.create!(id: 1, username: 'ned', password: 'stark', email: 'raven@raven.net', address: 'winterfell')
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit item_path(item)

    click_button 'Add to Cart'

    visit cart_path
    click_button 'Create Order'

    expect(current_path).to eq("/orders/3")
    expect(page).to have_content("Order Number: 3")
    expect(page).to have_content("Order Status: Ordered")
    expect(page).to have_content("Amount: $0.99")
  end
end
