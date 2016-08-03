require 'rails_helper'

RSpec.feature 'User reaches custom 404 for unused routes' do
  scenario 'they enter an invalid item id' do
    category = Category.create!(name: 'weapons')
    category.items.create!(id: 600, name: 'Ice5', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main3.jpg', price: 0.99, description: "it's cold")
    category.items.create!(id: 601, name: 'Ice56', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main4.jpg', price: 2.99, description: "it's colder")

    visit '/item/glamdring'

    expect(page).to have_content('404')
    expect(page).to have_content('NOT FOUND')
    expect(page).to have_content('Sorry, Gendry. Maybe next season.')
  end
end
