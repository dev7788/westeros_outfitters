require 'rails_helper'

RSpec.feature 'User is logged in' do
  scenario "they can checkout with Paypal" do
    item = Item.create!(name: "Ice", img: "image", price: 0.99, description: "this is a description")
    user = User.create!(username: 'Admin1', password: 'test', address: 'admin street', email: 'admin.com', role: 1)
    visit login_path
    fill_in 'Username', with: 'Admin1'
    fill_in 'Password', with: 'test'
    click_button 'Login'

    click_on "Items"

    within "#Ice" do
      click_on "Add to Cart"
    end

    click_on "View Cart"

    expect(current_path).to eq("/cart")

    click_on "Checkout"
    save_and_open_page

  end
end
