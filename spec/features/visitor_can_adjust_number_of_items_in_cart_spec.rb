require 'rails_helper'

RSpec.feature 'visitor can adjust number of items in cart' do
  scenario 'visitor can add another of a previously added item to their cart' do
    category = Category.create(name: 'weapons')
    category.items.create(name: 'Ice', img: 'image', price: 0.99, description: "it's cold")

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
end
