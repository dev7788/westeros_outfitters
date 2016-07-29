require 'rails_helper'

RSpec.feature 'authenticated user can view previous orders' do
  scenario 'they see their previous orders on the page' do

  # Background: An existing user that has one previous order
  # As an authenticated user
    category = Category.create!(name: 'weapons')
    item1 = category.items.create!(name: 'Ice', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg', price: 0.99, description: "it's cold")
    item2 = category.items.create!(name: 'Ice2', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main2.jpg', price: 2.99, description: "it's colder")
    user = User.create!(username: 'ned', password: 'stark', email: 'raven@raven.net', address: 'winterfell')
    order = user.orders.create!(amount: '$3.98')
    order.items << [item1, item2]
    order.items << item2
    require "pry"; binding.pry
  # When I visit "/orders"
    visit orders_path
  # Then I should see my past order
    expect(page).to have_content ("ID: 1")
    expect(page).to have_content ("Amount: $3.98")
    expect(page).to have_content ("Placed on:")
  # And I should see a link to view that order
    expect(page).to have_link ("ID: 1")
  # And when I click that link
    click_on ("ID: 1")
  # Then I should see each item that was order with the quantity and line-item subtotals
    expect(page).to have_content ('Ice')
    expect(page).to have_css ('img[src="http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg"]')
    expect(page).to have_content ('$0.99')
    expect(page).to have_content ("it's cold")
    expect(page).to have_content ('Item Total: $0.99')
    expect(page).to have_content ('Ice2')
    expect(page).to have_css ('img[src="http://www.valyriansteel.com/shop/images/uploads/ice-main2.jpg"]')
    expect(page).to have_content ('$2.99')
    expect(page).to have_content ("it's colder")
    expect(page).to have_content ('Item Total: $2.99')
  # And I should see links to each item's show page
    expect(page).to have_link ("Ice")
    expect(page).to have_link ("Ice2")
  # And I should see the current status of the order (ordered, paid, cancelled, completed)
    expect(page).to have_content ('Order Status: Ordered')
  # And I should see the total price for the order
    expect(page).to have_content ('Total: $3.98')
  # And I should see the date/time that the order was submitted
    expect(page).to have_content ("Submitted at #{order.created_at}")
  # If the order was completed or cancelled
    expect(page).to have_content ('Order Complete')
  # Then I should see a timestamp when the action took place
    expect(page).to have_content ("Submitted at #{order.updated_at}")
  end
end
