require 'rails_helper'

RSpec.feature 'authenticated user can view previous orders' do
  scenario 'they see their previous orders on the page' do

    category = Category.create!(name: 'weapons')
    category.items.create!(id: 15, name: 'Ice', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg', price: 0.99, description: "it's cold")
    category.items.create!(id: 16, name: 'Ice2', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main2.jpg', price: 2.99, description: "it's colder")
    user = User.create!(id: 1, username: 'ned', password: 'stark', email: 'raven@raven.net', address: 'winterfell')
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    cart = Cart.new({ '15' => 1, '16' => 2 })
    order = user.orders.create(amount: cart.total, status: 3)
    order.add_order_items(cart)

    visit orders_path

    expect(page).to have_content ('Order Number: 1')
    expect(page).to have_content ('Order Total: $6.97')
    expect(page).to have_content ('Created At: ')
    expect(page).to have_link ('Order Number: 1')

    click_on ('Order Number: 1')

    expect(page).to have_content ('Ice')
    expect(page).to have_content ('Quantity: 1')
    expect(page).to have_content ('Item Total: $0.99')
    expect(page).to have_content ('Ice2')
    expect(page).to have_content ('Quantity: 2')
    expect(page).to have_content ('Item Total: $5.98')
    expect(page).to have_link ('Ice')
    expect(page).to have_link ('Ice2')
    expect(page).to have_content ('Order Status: Completed')
    expect(page).to have_content ('Amount: $6.97')
    expect(page).to have_content ("Placed on: #{order.created_at}")
    expect(page).to have_content ('Order Complete')
    expect(page).to have_content ("Submitted at #{order.updated_at}")
  end
end
