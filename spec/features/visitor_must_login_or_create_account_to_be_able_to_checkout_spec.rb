require 'spec_helper'

RSpec.feature 'visitor must login or create account to be able to checkout' do
  scenario 'visitor creates account after putting items in cart' do

    category = Category.create(name: 'weapons')
    category.items.create(name: 'Ice', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg', price: 0.99, description: "it's cold")
    visit category_path(category)

    click_on 'Add to Cart'
    click_on 'View Cart'

    expect(page).to_not have_link('Checkout')
    expect(page).to have_content('Login or Create Account to Checkout')
    expect(page).to have_content ('Ice')
    expect(page).to have_css ('img[src="http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg"]')
    expect(page).to have_content ('$0.99')
    expect(page).to have_content ("it's cold")
    expect(page).to have_content ('Total: $0.99')

    click_on "Create Account"
    fill_in "Username", with: "matt"
    fill_in "Password", with: "campbell"
    fill_in "Email", with: "RRBean"
    fill_in "Address", with: "that one place"
    click_on "Create User"

    visit cart_path

    expect(current_path).to eq(cart_path)
    expect(page).to have_content('Your Cart')
    expect(page).to have_content ('Ice')
    expect(page).to have_css ('img[src="http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg"]')
    expect(page).to have_content ('$0.99')
    expect(page).to have_content ("it's cold")
    expect(page).to have_content ('Total: $0.99')
    expect(page).to have_content ('Checkout')

    click_on "Logout"

    expect(page).to have_content("Login")
    expect(page).to_not have_link("Checkout")
  end
end
