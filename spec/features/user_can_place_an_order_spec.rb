require 'rails_helper'

RSpec.feature 'User can place an order' do
  scenario 'they add two items to their cart and check out' do skip

    category = Category.create!(name: 'weapons')
    category.items.create!(id: 15, name: 'Ice', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg', price: 0.99, description: "it's cold")
    category.items.create!(id: 16, name: 'Ice2', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main2.jpg', price: 2.99, description: "it's colder")
    user = User.create!(id: 1, username: 'ned', password: 'stark', email: 'raven@raven.net', address: 'winterfell')
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    cart = Cart.new({ '15' => 1, '16' => 2 })

    visit cart_path
    require "pry"; binding.pry
    click_on "Checkout"
  end
end
