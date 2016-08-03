require 'rails_helper'

RSpec.feature 'Authenticated User Can only see their data' do
  scenario "they get an error when trying to see another user's private data" do
    user = User.create!(username: 'user', password: 'test', address: 'user street', email: 'user.com', role: 0)
    user2 = User.create!(username: 'user2', password: 'test', address: 'user street1', email: 'user2.com', role: 0)
    category = Category.create!(name: 'weapons')
    item1 = category.items.create!(id: 3, name: 'Ice', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg', price: 0.99, description: "it's cold")
    item2 = category.items.create!(id: 4, name: 'Ice2', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main2.jpg', price: 2.99, description: "it's colder")
    cart = Cart.new({ '3' => 1, '4' => 2 })
    order = user2.orders.create(amount: cart.total, status: 3)
    order.add_order_items(cart)

    visit login_path

    fill_in 'Username', with: 'user2'
    fill_in 'Password', with: 'test'

    click_button 'Login'

    visit user_path

    expect(page).to have_content()
    expect(page).to have_content('Hello, user2.')
    expect(current_path).to eq ('/dashboard')

    visit order_path(user2.orders.first.id)

    expect(page).to have_content ('Order Number: 2')
    expect(page).to have_content ('Amount: $6.97')
    expect(page).to have_content ('Submitted at ')
    expect(page).to have_content ('Ice')
    expect(page).to have_content ('Quantity: 1')
    expect(page).to have_content ('Item Total: $0.99')

    click_on 'Logout'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Goodbye!')

    click_on 'Login'

    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'test'

    click_button 'Login'

    expect(page).to have_content('Hello, user.')
    expect(current_path).to eq ('/dashboard')

    visit '/orders/1'

    expect(page).to have_content('404')
    expect(page).to have_content('Sorry, Gendry. Maybe next season.')
  end

  scenario 'user gets an error when visiting admin page' do
    user = User.create!(username: 'user', password: 'test', address: 'user street', email: 'user.com', role: 0)

    visit admin_dashboard_path

    expect(current_path).to eq ('/admin/dashboard')
    expect(page).to have_content('404')
    expect(page).to have_content('Sorry, Gendry. Maybe next season.')
  end
end
