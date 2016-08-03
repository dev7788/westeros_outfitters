require 'rails_helper'

RSpec.feature 'visitor can adjust number of items in cart' do
  scenario 'visitor can add and subtract an item in their cart' do
    category = Category.create!(name: 'weapons')
    category.items.create!(name: 'Ice', img: 'image', price: 0.99, description: "it's cold")

    visit items_path

    click_on 'Add to Cart'

    visit cart_path

    expect(page).to have_content('Ice')
    expect(page).to have_content('$0.99')
    expect(page).to have_content('Quantity: 1')

    click_button('+')

    expect(current_path).to eq(cart_path)
    expect(page).to have_content('Quantity: 2')
    expect(page).to have_content('$1.98')
    expect(page).to have_content('Total: $1.98')
    click_button('-')

    expect(current_path).to eq(cart_path)
    expect(page).to have_content('Quantity: 1')
    expect(page).to have_content('$0.99')
    expect(page).to have_content('Total: $0.99')
  end

  scenario 'subtract an item to 0 removes item from their cart' do
    category = Category.create!(name: 'weapons')
    category.items.create!(name: 'Ice', img: 'image', price: 0.99, description: "it's cold")

    visit items_path

    click_on 'Add to Cart'

    visit cart_path

    expect(current_path).to eq(cart_path)
    expect(page).to have_content('Quantity: 1')
    expect(page).to have_content('$0.99')
    expect(page).to have_content('Total: $0.99')
    click_button('-')

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Successfully removed Ice from your cart.")
    expect(page).to_not have_content('Quantity: 1')
    expect(page).to_not have_content('Total: $0.99')
  end
end
